//
//  DealerSpy.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 22/4/19.
//

import PlayingCards
@testable import Blackjack

final class DealerSpy: Dealer {
    weak var delegate: Dealer.GameDelegate?
    var hand: Hand?
    var createdHandWithCards: [Card]?
    func createHand(with cards: [Card]) throws { createdHandWithCards = cards }
    var playHandCalled: Bool = false
    func playHand() throws { playHandCalled = true }
    var discardHandCalled: Bool = false
    func discardHand() throws -> [Card] {
        discardHandCalled = true
        return hand?.cards ?? []
    }
    var collectedBet: UInt?
    public func collect(bet: UInt) {
        collectedBet = bet
    }
}
