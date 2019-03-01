//
//  CardShoe.swift
//  PlayingCards
//
//  Created by Maciej Piotrowski on 28/2/19.
//

import PlayingCards
import Shuffling

public protocol CardDealing {
    var isEmpty: Bool { get }
    func deal() -> Card?
    func discard(_ card: Card)
    func discard(_ cards: [Card])
    func emptyDiscardBox() -> [Card]
    func fillFromDiscardBox()
}

public protocol CardShuffling {
    func shuffleCards()
}

public class CardShoe: CardDealing, CardShuffling {
    private(set) var cards: [Card]
    private(set) var discardBox: [Card] = []
    public var isEmpty: Bool { return cards.isEmpty }
    let shuffler: Shuffling
    
    public init(deck: Deck, shuffler: Shuffling = Shuffler()) {
        self.cards = deck.cards
        self.shuffler = shuffler
    }
    
    public init(decks: [Deck], shuffler: Shuffling = Shuffler()) {
        self.cards = decks.flatMap({$0.cards})
        self.shuffler = shuffler
    }
    
    public static func with(numberOfDecks n: UInt) -> CardShoe {
        var decks: [Deck] = []
        guard n > 0 else { return CardShoe(decks: decks) }
        for _ in 1...n {
            decks.append(Deck.standardDeck())
        }
        return CardShoe(decks: decks)
    }
    
    public static func standardShoe() -> CardShoe {
        return CardShoe.with(numberOfDecks: 8)
    }
    
    public func deal() -> Card? {
        guard !isEmpty else { return nil }
        return cards.removeFirst()
    }
    
    public func discard(_ card: Card) {
        discardBox.append(card)
    }
    
    public func discard(_ cards: [Card]) {
        discardBox.append(contentsOf: cards)
    }
    
    public func emptyDiscardBox() -> [Card] {
        return removeAllCardsFromDiscardBox()
    }
    
    public func fillFromDiscardBox() {
        cards.append(contentsOf: emptyDiscardBox())
    }
    
    public func shuffleCards() {
        fillFromDiscardBox()
        cards = shuffler.shuffle(cards)
    }
}

protocol CardsRemoving {
    func removeAllCards() -> [Card]
    func removeAllCardsFromDiscardBox() -> [Card]
}

extension CardShoe: CardsRemoving {
    func removeAllCards() -> [Card] {
        defer {
            cards = []
        }
        return cards
    }
    
    func removeAllCardsFromDiscardBox() -> [Card] {
        defer {
            discardBox = []
        }
        return discardBox
    }
}

public class ContinuousCardShuffler: CardShoe {
    //todo: shuffle methods when count drops below n = 52?
    
}
