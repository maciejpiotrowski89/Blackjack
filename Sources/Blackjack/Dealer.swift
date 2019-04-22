//
//  Dealer.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 22/4/19.
//

import PlayingCards

public protocol Dealer: HandPlaying {
    var hand: Hand? { get }
}

public final class DealerImpl: Dealer {
    public var hand: Hand?
    public func createHand(with cards: [Card]) throws {
        
    }
    public func playHand() throws {
    }
    public func discardHand() {

    }
    
}
