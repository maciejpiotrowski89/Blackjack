//
//  Card+Extension.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 19/4/19.
//

import PlayingCards

extension Card {
    static func sample4() -> [Card] {
        return [Card(suit: .clubs, rank: .queen),
                Card(suit: .diamonds, rank: .ace),
                Card(suit: .spades, rank: .four),
                Card(suit: .hearts, rank: .two),
        ]
    }
}
