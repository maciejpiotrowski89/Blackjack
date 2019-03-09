//
//  DealerHand.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 9/3/19.
//

import PlayingCards

public struct DealerHand: Hand {
    
    
    public private(set) var cards: [Card]
    public var faceUpCard: Card! {
        return cards.first
    }
    public var options: PlayOption { return .standard }
    public var outcome: PlayOutcome { return .playing }
    
    public init(faceUp: Card, faceDown: Card) {
        self.cards = [faceUp, faceDown]
    }
    
    public func add(card: Card) {
        
    }
    
    public func stand() {
        
    }
}
