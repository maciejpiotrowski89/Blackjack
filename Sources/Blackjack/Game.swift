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
    noDealersHand(in: GameState)
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
    var playerHand: BettingHand? { get }
    var bet: UInt { get }
    var state: GameState { get }
}

public final class GameImpl: Game {
   
    private let shoe: PlayingCardShoe
    private let gameState: GameStateNavigator
    private(set) var player: Player
    private(set) var dealer: Dealer
    public var state: GameState { return gameState.state }
    public var playerHand: BettingHand? { return player.hand }
    public var dealerHand: Hand? { return dealer.hand }
    private var wager: UInt = 0
    public var bet: UInt {
        if state == .readyToPlay || state == .managingBets {
            return wager
        }
        return playerHand?.bet ?? 0
    }
    
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
        wager += chip.rawValue
    }
    
    public func reset() {
        guard state == .readyToPlay else { return }
        player.receive(chips: bet)
        wager = 0
    }
    
    public func play() throws {
        guard state == .readyToPlay else { throw GameError.roundInProgress }
        guard bet > 0 else { return }
        let cards = try dealCards()
        try player.createHand(with: cards.player, bet: bet)
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
        guard state == .playersTurn else { throw GameError.impossibleStateTransition(from: state, to: .dealersTurn) }
        try playDealersTurn()
    }
    
    public func finishDealersTurn() throws {
        guard state == .dealersTurn else { throw GameError.impossibleStateTransition(from: state, to: .managingBets) }
        try settleRound()
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
    
    enum Winner {
        case draw, player, dealer
    }
    
    private func settleRound() throws {
        try gameState.navigate(to: .managingBets)
        guard let playerHand = playerHand else { throw GameError.noPlayersHand(in: self.state) }
        guard let dealerHand = dealerHand else { throw GameError.noDealersHand(in: self.state) }
        switch(winner(playerHand, dealerHand)) {
        case .draw:
            player.receive(chips: playerHand.bet)
        case .player:
            let multiplier: Double = playerHand.outcome == .blackjack ? 2.5 : 2.0
            let payout: Double = (multiplier * Double(playerHand.bet)).rounded(FloatingPointRoundingRule.up)
            player.receive(chips: UInt(payout))
        case .dealer:
            dealer.collect(bet: playerHand.bet)
        }
        wager = 0
        shoe.discard(playerHand.cards)
        shoe.discard(dealerHand.cards)
        player.discardHand()
        dealer.discardHand()
    }
    
    private func winner(_ playerHand: Hand,
                        _ dealerHand: Hand) -> Winner {
        var winner: Winner = .dealer
        if playerHand == dealerHand {
            winner = .draw
        } else if playerHand > dealerHand {
            winner = .player
        }
        return winner
    }
}
