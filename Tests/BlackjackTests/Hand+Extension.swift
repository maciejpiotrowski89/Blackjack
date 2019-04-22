//
//  File.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 22/4/19.
//

import Blackjack
import PlayingCards

extension DealerHand {
    static func sampleHand() -> DealerHand {
        return DealerHand(faceUp: Card(suit: .clubs, rank: .queen),
                          faceDown: Card(suit: .diamonds, rank: .two))
    }
}

extension PlayerHand {
    static func sampleHand() -> PlayerHand {
        return PlayerHand(bet: 10,
                          first: Card(suit: .hearts, rank: .two),
                          second: Card(suit: .hearts, rank: .four))
    }
}
