//
//  DealerHand.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 9/3/19.
//

import PlayingCards

public struct DealerHand: Hand {
    public var options: PlayOption { return [] }
    
    
    public private(set) var cards: [Card]
    public var faceUpCard: Card! {
        return cards.first
    }
    
    public var outcome: PlayOutcome { return .playing }
    
    public init(cards: [Card] = []) {
        self.cards = cards
    }
    
    public func add(card: Card) {
        
    }
    
    public func stand() {
        
    }
}
