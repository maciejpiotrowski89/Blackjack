//
//  CardShoeSpy.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 19/4/19.
//

import PlayingCards
@testable import Blackjack

final class CardShoeSpy: PlayingCardShoe {
    var isEmpty: Bool = false
    var dealCount: Int = 0
    func deal() -> Card? {
        var card: Card?
        let divider: Int = (cards.count != 0) ? cards.count: 1
        let index = (dealCount % divider)
        if index < cards.count {
            card = cards[index]
        }
        dealCount += 1;
        return card
    }
    func discard(_ card: Card)  {}
    func discard(_ cards: [Card]) {}
    func emptyDiscardBox() -> [Card] { return [] }
    func fillFromDiscardBox() {}
    func shuffleCards() {}
    var cards: [Card] = []
    @discardableResult func prepareCards(_ cards:[Card] = Card.sample4()) -> [Card] {
        self.cards = cards
        return cards
    }
}
