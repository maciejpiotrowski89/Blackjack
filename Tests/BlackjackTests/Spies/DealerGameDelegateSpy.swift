//
//  DealerGameDelegateSpy.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 3/5/19.
//

import PlayingCards
@testable import Blackjack

class DealerGameDelegateSpy: Dealer.GameDelegate {
    var dealCardCalled = false
    var dealCardReturned: Card!
    func dealCard() throws -> Card {
        dealCardCalled = true
        return dealCardReturned ?? Card.sampleCard()
    }
    
    var finishDealersTurnCalled = false
    func finishDealersTurn() throws {
        finishDealersTurnCalled = true
    }
}
