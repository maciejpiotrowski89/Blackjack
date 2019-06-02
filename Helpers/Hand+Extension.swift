//
//  File.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 22/4/19.
//

@testable import Blackjack
import PlayingCards

extension DealerHand {
    static func sampleHand() -> DealerHand {
        return DealerHand.sample12Hand()
    }

    static func sample12Hand() -> DealerHand {
        return DealerHand(cards:
            [
                Card(suit: .clubs, rank: .queen),
                Card(suit: .diamonds, rank: .two),
            ]
        )
    }

    static func sample21Hand() -> DealerHand {
        return DealerHand(cards:
            [
                Card(suit: .clubs, rank: .queen),
                Card(suit: .diamonds, rank: .five),
                Card(suit: .hearts, rank: .three),
                Card(suit: .clubs, rank: .three),
            ]
        )
    }

    static func sampleBlackjackHand() -> DealerHand {
        return DealerHand(cards:
            [
                Card(suit: .clubs, rank: .ace),
                Card(suit: .diamonds, rank: .king),
            ]
        )
    }

    static func sample17Hand() -> DealerHand {
        return DealerHand(cards:
            [
                Card(suit: .clubs, rank: .two),
                Card(suit: .diamonds, rank: .three),
                Card(suit: .hearts, rank: .two),
                Card(suit: .clubs, rank: .four),
                Card(suit: .spades, rank: .six),
            ]
        )
    }

    static func sample18Hand() -> DealerHand {
        return DealerHand(cards:
            [
                Card(suit: .clubs, rank: .two),
                Card(suit: .diamonds, rank: .four),
                Card(suit: .hearts, rank: .two),
                Card(suit: .clubs, rank: .four),
                Card(suit: .spades, rank: .six),
            ]
        )
    }

    static func sampleBustHand() -> DealerHand {
        return DealerHand(cards:
            [
                Card(suit: .clubs, rank: .two),
                Card(suit: .diamonds, rank: .four),
                Card(suit: .hearts, rank: .ten),
                Card(suit: .clubs, rank: .king),
            ]
        )
    }
}

extension PlayerHand {
    static func sampleHand(with bet: UInt = 10) -> PlayerHand {
        return PlayerHand(bet: bet,
                          first: Card(suit: .hearts, rank: .two),
                          second: Card(suit: .hearts, rank: .four))
    }

    static func sample21Hand(with bet: UInt = 10) -> PlayerHand {
        return PlayerHand(bet: bet, cards:
            [
                Card(suit: .clubs, rank: .five),
                Card(suit: .diamonds, rank: .five),
                Card(suit: .hearts, rank: .three),
                Card(suit: .clubs, rank: .three),
                Card(suit: .clubs, rank: .three),
                Card(suit: .clubs, rank: .two),
            ])
    }

    static func sampleBlackjackHand(with bet: UInt = 10) -> PlayerHand {
        return PlayerHand(bet: bet, cards:
            [
                Card(suit: .spades, rank: .king),
                Card(suit: .spades, rank: .ace),
            ])
    }

    static func sample17Hand(with bet: UInt = 10) -> PlayerHand {
        return PlayerHand(bet: bet, cards:
            [
                Card(suit: .clubs, rank: .ace),
                Card(suit: .diamonds, rank: .ace),
                Card(suit: .hearts, rank: .two),
                Card(suit: .hearts, rank: .five),
                Card(suit: .hearts, rank: .three),
                Card(suit: .clubs, rank: .five),
            ])
    }

    static func sample18Hand(with bet: UInt = 10) -> PlayerHand {
        return PlayerHand(bet: bet, cards:
            [
                Card(suit: .hearts, rank: .two),
                Card(suit: .hearts, rank: .five),
                Card(suit: .hearts, rank: .two),
                Card(suit: .clubs, rank: .five),
                Card(suit: .clubs, rank: .four),
            ])
    }

    static func sample19Hand(with bet: UInt = 10) -> PlayerHand {
        return PlayerHand(bet: bet, cards:
            [
                Card(suit: .hearts, rank: .two),
                Card(suit: .hearts, rank: .five),
                Card(suit: .hearts, rank: .three),
                Card(suit: .clubs, rank: .five),
                Card(suit: .clubs, rank: .four),
            ])
    }

    static func sample19_2card_Hand(with bet: UInt = 10) -> PlayerHand {
        return PlayerHand(bet: bet, cards:
            [
                Card(suit: .hearts, rank: .nine),
                Card(suit: .hearts, rank: .king),
            ])
    }

    static func sample20_2card_Hand(with bet: UInt = 10) -> PlayerHand {
        return PlayerHand(bet: bet, cards:
            [
                Card(suit: .hearts, rank: .ten),
                Card(suit: .hearts, rank: .king),
            ])
    }

    static func sampleBustHand(with bet: UInt = 10) -> PlayerHand {
        return PlayerHand(bet: bet, cards:
            [
                Card(suit: .clubs, rank: .five),
                Card(suit: .spades, rank: .five),
                Card(suit: .diamonds, rank: .king),
                Card(suit: .hearts, rank: .four),
                Card(suit: .clubs, rank: .ten),
            ]
        )
    }
}
