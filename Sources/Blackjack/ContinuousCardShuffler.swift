//
//  ContinuousCardShuffler.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 4/3/19.
//

import Foundation
import PlayingCards

public class ContinuousCardShuffler: CardShoe {

    public override func discard(_ cards: [Card]) {
        super.discard(cards)
        shuffleCards()
    }
}
