//
//  Hand.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 9/3/19.
//

import PlayingCards

public protocol Hand {
    var bet: UInt { get }
    var value: UInt { get }
    var highValue: UInt { get }
    var cards: [Card] { get }
    var options: PlayOption { get }
    var outcome: PlayOutcome { get }
    mutating func add(card: Card)
    mutating func stand()
    mutating func doubleBet()
}

extension Hand {
    public var bet: UInt { return 0 }
    public var value: UInt { return 0 }//return cards.reduce(0) { $0 + $1.blackjackValue } }
    public var highValue: UInt { return 0 }
//    return cards
//    .sorted(by: >)
//    .reduce(0) { (result, card) -> UInt in
//    var value = card.blackjackValue
//    if  card.rank == .ace &&
//    result + card.highValue <= Blackjack  {
//    value = card.highValue
//    }
//    return result + value
//    }
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
