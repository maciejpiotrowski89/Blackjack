//
//  CardShoeSpy.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 19/4/19.
//

@testable import Blackjack
import PlayingCards

final class CardShoeSpy: PlayingCardShoe {
    var isEmpty: Bool = false
    var dealCount: Int = 0
    func deal() -> Card? {
        var card: Card?
        let divider: Int = !cards.isEmpty ? cards.count : 1
        let index = (dealCount % divider)
        if index < cards.count {
            card = cards[index]
        }
        dealCount += 1
        return card
    }

    var discardedCards: [Card] = []
    func discard(_ card: Card) { discardedCards.append(card) }
    func discard(_ cards: [Card]) { discardedCards += cards }
    func emptyDiscardBox() -> [Card] { return [] }
    func fillFromDiscardBox() {}
    func shuffleCards() {}
    var cards: [Card] = []
    @discardableResult func prepareCards(_ cards: [Card] = Card.sample4()) -> [Card] {
        self.cards = cards
        return cards
    }
}
