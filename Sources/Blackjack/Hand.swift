//
//  Hand.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 9/3/19.
//

import PlayingCards

public protocol Hand {
    var value: UInt { get }
    var highValue: UInt { get }
    var cards: [Card] { get }
    var options: HandOption { get }
    var outcome: HandOutcome { get }
    mutating func add(card: Card)
}

public protocol BettingHand: Hand {
    var bet: UInt { get }
    mutating func doubleBet()
    mutating func stand()
}

extension Hand {
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
}

public func < (lhs: Hand, rhs: Hand) -> Bool {
    return lhs.value < rhs.value
}

public func  > (lhs: Hand, rhs: Hand) -> Bool {
    return lhs.value > rhs.value
}

public func == (lhs: Hand, rhs: Hand) -> Bool {
    return lhs.value == rhs.value
}

public func != (lhs: Hand, rhs: Hand) -> Bool {
    return !(lhs == rhs)
}
