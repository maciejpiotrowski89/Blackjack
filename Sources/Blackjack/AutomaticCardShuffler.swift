//
//  AutomaticCardShuffler.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 4/3/19.
//

import Foundation
import PlayingCards
import Shuffling

public class AutomaticCardShuffler: CardShoe {
    private(set) var threshold: Int = 0

    public override init(decks: [Deck], shuffler: Shuffling = Shuffler()) {
        super.init(decks: decks, shuffler: shuffler)
        threshold = Int(Double(cards.count) * 0.75)
    }

    public override func discard(_ cards: [Card]) {
        super.discard(cards)
        if discardBox.count >= threshold {
            shuffleCards()
        }
    }
}
