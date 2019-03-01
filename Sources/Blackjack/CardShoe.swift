//
//  CardShoe.swift
//  PlayingCards
//
//  Created by Maciej Piotrowski on 28/2/19.
//

import PlayingCards

public struct CardShoe {
    public private(set) var cards: [Card]
    
    public init(deck: Deck) {
        self.cards = deck.cards
    }
    
    public init(decks: [Deck]) {
        self.cards = decks.flatMap({$0.cards})
    }
    
    public static func with(numberOfDecks n: UInt) -> CardShoe {
        var decks: [Deck] = []
        guard n > 0 else { return CardShoe(decks: decks) }
        for _ in 1...n {
            decks.append(Deck.standardDeck())
        }
        return CardShoe(decks: decks)
    }
    
    //todo: ShuffledShoe subclass ?
    //todo: shuffle methods when count drops below n?
    //todo: discard ?
    

}
