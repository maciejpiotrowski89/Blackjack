//
//  PlayerHand.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 9/3/19.
//

import PlayingCards

public struct PlayerHand: Hand {
    
    private var initialBet: UInt
    public var bet: UInt {
        return doubled ? initialBet * 2 : initialBet
    }
    
    public private(set) var cards: [Card]
    public init(bet: UInt, cards: [Card] = []) {
        self.initialBet = bet
        self.cards = cards
    }
    
    public var value: UInt {
        return outcome == .stood ? highValue : cards.reduce(0) { $0 + $1.blackjackValue }
    }
    
    public var highValue: UInt {
        return cards
            .sorted(by: >)
            .reduce(0) { (result, card) -> UInt in
                var value = card.blackjackValue
                if  card.rank == .ace &&
                    result + card.highValue <= Blackjack  {
                    value = card.highValue
                }
                return result + value
        }
    }
    
    public var options: PlayOption {
        if  outcome != .playing {
            return []
        }
        
        if cards.count > 2 {
            return .standard
        }
        
        if cards.count == 2 {
            return cards[0].blackjackValue == cards[1].blackjackValue ? .pair : .initial
        }
        
        return  []
    }
    
    
    public var outcome: PlayOutcome {
        if highValue == Blackjack {
            return cards.count == 2 ? .blackjack : .stood
        } else if highValue > Blackjack {
            return .bust
        } else if stood {
            return .stood
        } else if doubled {
            return .doubled
        }
        return .playing
    }
    
    public mutating func add(card: Card) {
        guard !stood else { return }
        cards.append(card)
        guard outcome == .doubled else { return }
        stand()
    }
    
    private var doubled = false
    public mutating func doubleBet() {
        guard cards.count == 2 else { return }
        doubled = true
    }
    
    private var stood = false
    public mutating func stand() {
        stood = true
    }
}
