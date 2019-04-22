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
    unknownStateNavigation,
    impossibleStateTransition
}

public protocol CardDealer: class {
    func dealCard() throws -> Card
}

public protocol PlayersTurnDelegate: class {
    func bet(_ chip: Chip)
    func reset()
    func play() throws
    func finishPlayersTurn() throws
}

public protocol DealersTurnDelegate: class {
    func finishDealersTurn() throws
}

public protocol Game: CardDealer, PlayersTurnDelegate, DealersTurnDelegate {
    var dealerHand: Hand? { get }
    var playerHand: Hand? { get }
    var bet: UInt { get }
    var state: GameState { get }
}

public final class GameImpl: Game {
   
    private let shoe: PlayingCardShoe
    private let gameState: GameStateNavigator
    private(set) var player: Player
    private(set) var dealer: Dealer
    public var state: GameState { return gameState.state }
    public var playerHand: Hand? { return player.hand }
    public var dealerHand: Hand? { return dealer.hand }
    public private(set) var bet: UInt = 0
    
    init(shoe: PlayingCardShoe,
         player: Player,
         dealer: Dealer,
         stateNavigator: GameStateNavigator) {
        self.shoe = shoe
        self.player = player
        self.dealer = dealer
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
        let cards = try dealCards()
        try player.createHand(with: cards.player)
        try dealer.createHand(with: cards.dealer)
        try gameState.navigate(to: .playersTurn)
        try player.playHand()
    }
    
    public func dealCard() throws -> Card {
        guard state == .playersTurn || state == .dealersTurn else { throw GameError.cannotDealWhenRoundIsNotInProgress }
        guard let card = shoe.deal() else { throw GameError.cardShoeIsEmpty }
        return card
    }

    public func finishPlayersTurn() throws {
        guard state == .playersTurn else { return }
        try playDealersTurn()
    }
    
    public func finishDealersTurn() throws {
    }
}

extension GameImpl {
    private struct Cards {
        var player: [Card]
        var dealer: [Card]
    }
    
    private func dealCards() throws -> Cards {
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
        return Cards(player: playerCards,
                     dealer: dealerCards)
    }
    
    private func playDealersTurn() throws {
        try gameState.navigate(to: .dealersTurn)
        try dealer.playHand()
    }
    
    private func settleRound() throws {
    }
}
