//
//  Hand.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 9/3/19.
//

import PlayingCards

public protocol Hand {
    var bet: Int { get }
    var value: Int { get }
    var cards: [Card] { get }
    var options: PlayOption { get }
    var outcome: PlayOutcome { get }
    mutating func add(card: Card)
    mutating func stand()
    mutating func doubleBet()
}

extension Hand {
    public var bet: Int { return 0 }
    public var options: PlayOption { return .standard }
    public var value: Int { return cards.reduce(0) { $0 + $1.blackjackValue } }
    public mutating func doubleBet() {}
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
