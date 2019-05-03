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

extension HandPlaying {
    public func playHand() throws { }
}

public protocol Player: ChipsManaging, HandPlaying {
    typealias GameDelegate = (CardDealer & PlayersTurnDelegate)
    var delegate: GameDelegate? { get set }
    var hand: BettingHand? { get }
    mutating func createHand(with cards: [Card], bet: UInt) throws
    func bet(_: Chip)
    func hit()
    func doubleDown()
    func stand()
}

public class PlayerImpl: Player {
    public var hand: BettingHand? { return playerHand }
    private(set) var playerHand: PlayerHand?
    public weak var delegate: Player.GameDelegate?
    
    public func createHand(with cards: [Card], bet: UInt) throws {
    }
    
    public func bet(_ chip: Chip) {
    }
    
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
