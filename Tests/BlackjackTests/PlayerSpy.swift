//
//  PlayerSpy.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 19/4/19.
//

import PlayingCards
@testable import Blackjack

final class PlayerSpy: Player {
    var hand: BettingHand?
    func bet(_ :UInt) {}
    func hit() {}
    func doubleDown() {}
    func stand() {}
    var playedHandWithCards: [Card]?
    func playHand(with cards: [Card]) throws { playedHandWithCards = cards }
    var chipsValue: UInt = 0
    var receivedChips: UInt?
    func receive(chips: UInt) { receivedChips = chips }
}
