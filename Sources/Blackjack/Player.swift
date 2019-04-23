//
//  Player.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 16/4/19.
//

import PlayingCards

public protocol HandPlaying {
    func playHand() throws
    func discardHand()
}

public protocol Player: ChipsManaging, HandPlaying {
    var hand: BettingHand? { get }
    mutating func createHand(with cards: [Card], bet: UInt) throws
    func bet(_ :UInt) //Ask delegate to bet a Chip
    func hit() //Ask delegate to get a card, adds card to the hand
    func doubleDown() //doubles the wager: hand.doubleDown(), chips-=bet and hit()
    func stand() //stops playing a hand, asks delegate to finish round
}

public class PlayerImpl {
    typealias GameDelegate = (CardDealer & PlayersTurnDelegate)
    weak var delegate: GameDelegate?
}
