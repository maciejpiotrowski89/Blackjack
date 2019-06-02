//
//  PlayerSpy.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 19/4/19.
//

@testable import Blackjack
import PlayingCards

final class PlayerSpy: Player {
    weak var game: Player.GameDelegate?
    weak var dealer: CardDealer?
    var hand: BettingHand?
    func startGame() {}
    func clearBet() {}
    func bet(_: Chip) {}
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
