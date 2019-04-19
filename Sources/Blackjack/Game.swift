//
//  Game.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 16/4/19.
//

import PlayingCards

public enum GameError: Error {
    case cardShoeIsEmpty,
    roundInProgress,
    unknownStateNavigation,
    impossibleStateTransition
}

public protocol CardDealer: class {
    func dealCard() -> Card
}

public protocol PlayerRoundDelegate: class {
    func bet(_ chip: Chip) //adds chips
    func reset() //gives chips back to player
    func play() throws
    func finishTurn() //finishes player's turn
}

public protocol Game: CardDealer, PlayerRoundDelegate {
    var dealerHand: Hand? { get }
    var playerHand: Hand? { get }
    var bet: UInt { get }
    var state: GameState { get }
}

public final class GameImpl: Game {
   
    private let shoe: PlayingCardShoe
    private let gameState: GameStateNavigator
    private(set) var player: Player
    public var state: GameState { return gameState.state }
    public var dealerHand: Hand?
    public var playerHand: Hand? { return player.hand }
    public private(set) var bet: UInt = 0
    
    init(shoe: PlayingCardShoe,
         player: Player,
         stateNavigator: GameStateNavigator) {
        self.shoe = shoe
        self.player = player
        self.gameState = stateNavigator
    }
    
    public func bet(_ chip: Chip) {
        guard state == .readyToPlay else { return }
        bet += chip.rawValue
    }
    
    public func reset() {
        guard state == .readyToPlay else { return }
        player.receive(chips: bet)
        bet = 0
    }
    
    public func play() throws {
        guard bet > 0 else { return }
        guard state == .readyToPlay else { throw GameError.roundInProgress }
        var playerCards: [Card] = []
        var dealerCards: [Card] = []
        for i in 1...4 {
            guard let card = shoe.deal() else { throw GameError.cardShoeIsEmpty }
            if i.isMultiple(of: 2) {
                dealerCards.append(card)
            } else {
                playerCards.append(card)
            }
        }
        try! player.playHand(with: playerCards)
        dealerHand = DealerHand(cards: dealerCards)
        try! gameState.navigate(to: .playersTurn)
    }
    
    public func dealCard() -> Card {
        fatalError("Not implemented")
    }

    public func finishTurn() {
    }
}