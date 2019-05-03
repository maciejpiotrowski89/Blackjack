//
//  PlayerSpy.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 19/4/19.
//

import PlayingCards
@testable import Blackjack

final class PlayerSpy: Player {
    weak var delegate: Player.GameDelegate?
    var hand: BettingHand?
    func bet(_ :UInt) {}
    func hit() {}
    func doubleDown() {}
    func stand() {}
    var createdHandWithCards: [Card]?
    var createdHandWithBet: UInt?
    func createHand(with cards: [Card], bet: UInt) throws {
        createdHandWithCards = cards
        createdHandWithBet = bet
    }
    var playHandCalled: Bool = false
    func playHand() throws { playHandCalled = true }
    var chipsValue: UInt = 0
    var receivedChips: UInt?
    func receive(chips: UInt) { receivedChips = chips }
    var discardHandCalled: Bool = false
    func discardHand() throws -> [Card] {
        discardHandCalled = true
        return hand?.cards ?? []
    }
}
