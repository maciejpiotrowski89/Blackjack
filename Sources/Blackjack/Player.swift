//
//  Player.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 16/4/19.
//

import PlayingCards

public protocol HandPlaying {
    func playHand() throws
    func discardHand() throws -> [Card] 
}

public protocol Player: class, ChipsManaging, HandPlaying {
    typealias GameDelegate = (Starting & PlayersTurnDelegate)
    var game: GameDelegate? { get set }
    var dealer: CardDealer? {get set}
    
    func bet(_: Chip)
    func clearBet()
    
    func startGame() throws
    
    var hand: BettingHand? { get }
    func createHand(with cards: [Card], bet: UInt) throws
    
    func hit()
    func doubleDown()
    func stand()
}

public class PlayerImpl: Player {
    
    public var hand: BettingHand? { return playerHand }
    private(set) var playerHand: PlayerHand?
    public weak var game: Player.GameDelegate?
    public weak  var dealer: CardDealer?

    public func bet(_ chip: Chip) {
        game?.bet(chip)
    }
    
    public func clearBet() {
        game?.resetBet()
    }
    
    public func startGame() throws {
        try game?.start()
    }
    
    public func createHand(with cards: [Card], bet: UInt) throws {
        guard cards.count == 2 else { throw GameError.cannotCreateHandFromCards(cards)}
        guard bet > 0 else { throw GameError.cannotBetZero }
        playerHand = PlayerHand(bet: bet, cards: cards)
    }
    
    public func playHand() throws { }

    public func hit() {
    }
    
    public func doubleDown() {
    }
    
    public func stand() {
    }
    
    public var chipsValue: UInt = 0
    
    public func receive(chips: UInt) {
    }
    
    public func discardHand() throws -> [Card] {
        return []
    }
}
