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

public protocol CardDealer: class {
    func dealCard() throws -> Card
}

public protocol Starting: class {
    func start() throws
}

public protocol PlayersTurnDelegate: class {
    func bet(_ chip: Chip)
    func resetBet()
    func finishPlayersTurn() throws
}

public protocol DealersTurnDelegate: class {
    func finishDealersTurn() throws
}

public enum GameOutcome {
    case playerHadBlackjack, playerWon, playerBusted, playerLost, draw
}

public protocol GameOutcomeDelegate: class {
    func game(_ game: Game, didFinishWithOutcome outcome: GameOutcome)
}

public protocol Game: Starting {
    var dealerHand: Hand? { get }
    var playerHand: BettingHand? { get }
    var bet: UInt { get }
    var state: GameState { get }
    var delegate: GameOutcomeDelegate? { get set }
}
