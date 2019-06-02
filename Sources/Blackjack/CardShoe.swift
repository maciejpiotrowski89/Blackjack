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

public typealias PlayingCardShoe = CardDealing & CardShuffling

public class CardShoe: PlayingCardShoe {
    private(set) var cards: [Card]
    private(set) var discardBox: [Card] = []
    public var isEmpty: Bool { return cards.isEmpty }
    let shuffler: Shuffling

    public init(decks: [Deck], shuffler: Shuffling = Shuffler()) {
        self.cards = decks.flatMap({ $0.cards })
        self.shuffler = shuffler
    }

    public convenience init(deck: Deck, shuffler: Shuffling = Shuffler()) {
        self.init(decks: [deck], shuffler: shuffler)
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
        return CardShoe.with(numberOfDecks: 6)
    }

    public func deal() -> Card? {
        guard !isEmpty else { return nil }
        return cards.removeFirst()
    }

    public final func discard(_ card: Card) {
        self.discard([card])
    }

    public func discard(_ cards: [Card]) {
        discardBox.append(contentsOf: cards)
    }

    public func emptyDiscardBox() -> [Card] {
        return removeAllCards(from: \.discardBox)
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
    func removeAllCards(from kp: ReferenceWritableKeyPath<CardShoe, [Card]>) -> [Card]
}

extension CardShoe: CardsRemoving {
    func removeAllCards(from kp: ReferenceWritableKeyPath<CardShoe, [Card]>) -> [Card] {
        defer {
            self[keyPath: kp] = []
        }
        return self[keyPath: kp]
    }
}
