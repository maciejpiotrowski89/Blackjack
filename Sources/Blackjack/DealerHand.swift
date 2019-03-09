//
//  DealerHand.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 9/3/19.
//

import PlayingCards

public struct DealerHand: Hand {
    
    public private(set) var cards: [Card]
    
    public var outcome: PlayOutcome { return .playing }
    
    public func add(card: Card) {
        
    }
    
    public func stand() {
        
    }
}
