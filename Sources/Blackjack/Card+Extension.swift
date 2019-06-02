//
//  Card+Extension.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 8/3/19.
//

import PlayingCards

extension Card: BlackjackValue {
    var blackjackValue: UInt {
        switch rank {
        case .jack, .queen, .king: return 10
        default: return rank.rawValue
        }
    }

    var highValue: UInt {
        return rank == .ace ? 11 : blackjackValue
    }
}

extension Card: Comparable {
    public static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rawValue < rhs.rank.rawValue
    }
}
