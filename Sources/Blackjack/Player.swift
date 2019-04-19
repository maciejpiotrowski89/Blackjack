//
//  Player.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 16/4/19.
//

import PlayingCards



public protocol Player: ChipsManaging {
    var hand: BettingHand? { get }
    func bet(_ :UInt)         //Bet -> ask delegate to deal cards (create a hand)
    func hit() //Ask delegate to get a card
    func doubleDown()         //doubles the wager and hits
    func stand()//stops playing a hand
    mutating func playHand(with cards: [Card]) throws
}

public class PlayerImpl {
    typealias GameDelegate = (CardDealer & PlayerRoundDelegate)
    weak var delegate: GameDelegate?
}
