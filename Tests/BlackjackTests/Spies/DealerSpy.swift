//
//  DealerSpy.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 22/4/19.
//

import PlayingCards
@testable import Blackjack

final class DealerSpy: Dealer {
    var hand: Hand?
    var createdHandWithCards: [Card]?
    func createHand(with cards: [Card]) throws { createdHandWithCards = cards }
    var playHandCalled: Bool = false
    func playHand() throws { playHandCalled = true }
    var discardHandCalled: Bool = false
    func discardHand() {
        discardHandCalled = true
    }
}
