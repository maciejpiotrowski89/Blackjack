//
//  DealerHand.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 9/3/19.
//

import PlayingCards

public struct DealerHand: Hand {
    
    public private(set) var cards: [Card]
    public var faceUpCard: Card! {
        return cards.first
    }
    public init(faceUp: Card, faceDown: Card) {
        self.cards = [faceUp, faceDown]
    }

    public var options: HandOption {
        switch outcome {
        case .playing: return .standard
        case .blackjack, .bust, .stood: return []
        case .doubled: fatalError("Impossible outcome for Dealer's Hand")
        }
    }
    
    public var outcome: HandOutcome {
        if highValue == Blackjack && cards.count == 2 {
            return .blackjack
        } else if highValue > Blackjack {
            return .bust
        } else if highValue >= 17 {
            return .stood
        }
        return .playing
    }
    
    public mutating func add(card: Card) {
        guard outcome == .playing else { return }
        cards.append(card)
    }
}

extension DealerHand {
    init(cards: [Card]) {
        precondition(cards.count >= 2)
        self.cards = cards
    }
}
