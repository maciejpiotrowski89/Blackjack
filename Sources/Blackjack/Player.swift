//
//  Player.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 16/4/19.
//

import PlayingCards

public protocol HandPlaying {
    mutating func createHand(with cards: [Card]) throws
    func playHand() throws
}

public protocol Player: ChipsManaging, HandPlaying {
    var hand: BettingHand? { get }
    func bet(_ :UInt)         //Bet -> ask delegate to deal cards (create a hand)
  
    func hit() //Ask delegate to get a card
    
    func doubleDown()         //doubles the wager and hits

    func stand()//stops playing a hand
    
}

public class PlayerImpl {
    typealias GameDelegate = (CardDealer & PlayersTurnDelegate)
    weak var delegate: GameDelegate?
}
