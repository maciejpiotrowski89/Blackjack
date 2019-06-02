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
}

public protocol MutableHand: Hand {
    mutating func add(card: Card)
}

public protocol BettingHand: MutableHand {
    var bet: UInt { get }
    mutating func doubleBet()
    mutating func stand()
}

public protocol SplitHand: Hand {
    mutating func split()
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
                if card.rank == .ace,
                    result + card.highValue <= Int.Blackjack {
                    value = card.highValue
                }
                return result + value
            }
    }
}

// swiftlint:disable cyclomatic_complexity
public func < (lhs: Hand, rhs: Hand) -> Bool {
    if lhs == rhs { return false }
    if lhs.outcome == .bust { return true }
    if rhs.outcome == .bust { return false }
    if lhs.outcome == .blackjack, rhs.outcome != .blackjack { return false }
    if lhs.outcome != .blackjack, rhs.outcome == .blackjack { return true }
    return lhs.highValue < rhs.highValue
}

// swiftlint:enable cyclomatic_complexity

public func > (lhs: Hand, rhs: Hand) -> Bool {
    return !(lhs < rhs) && lhs != rhs
}

public func == (lhs: Hand, rhs: Hand) -> Bool {
    if lhs.outcome == .bust, rhs.outcome == .bust { return true }
    if ([lhs, rhs].filter { $0.outcome == .blackjack }).count == 1 { return false }
    return lhs.highValue == rhs.highValue
}

public func != (lhs: Hand, rhs: Hand) -> Bool {
    return !(lhs == rhs)
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Hand) {
        let intetrpolation = value.outcome == .blackjack ?
            value.outcome.rawValue.capitalized : "\(value.highValue)"
        appendInterpolation(intetrpolation)
    }
}
