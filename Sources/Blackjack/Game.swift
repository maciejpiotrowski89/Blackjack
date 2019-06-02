//
//  Game.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 16/4/19.
//

import PlayingCards

public enum GameError: Error {
    case unknown,
        cardShoeIsEmpty,
        roundInProgress,
        cannotDealWhenRoundIsNotInProgress,
        impossibleStateTransition(from: GameState, to: GameState),
        noPlayersHand(in: GameState),
        noDealersHand(in: GameState),
        cannotCreateHandFromCards([Card]),
        noHandToPlay,
        noHandToDiscard,
        cannotBetZero
}

public protocol CardDealer: AnyObject {
    func dealCard() throws -> Card
}

public protocol Starting: AnyObject {
    func start() throws
}

public protocol PlayersTurnDelegate: AnyObject {
    func bet(_ chip: Chip)
    func resetBet()
    func finishPlayersTurn() throws
}

public protocol DealersTurnDelegate: AnyObject {
    func finishDealersTurn() throws
}

public enum GameOutcome {
    case playerHadBlackjack, playerWon, playerBusted, playerLost, draw
}

public protocol GameOutcomeDelegate: AnyObject {
    func game(_ game: Game, didFinishWithOutcome outcome: GameOutcome)
}

public protocol Game: Starting {
    var dealerHand: Hand? { get }
    var playerHand: BettingHand? { get }
    var bet: UInt { get }
    var state: GameState { get }
    var delegate: GameOutcomeDelegate? { get set }
}
