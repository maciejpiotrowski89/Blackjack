//
//  AutomaticCardShufflerTests.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 4/3/19.
//

@testable import Blackjack
import PlayingCards
import XCTest

final class AutomaticCardShufflerTests: XCTestCase {
    var sut: AutomaticCardShuffler!
    var shuffler: ShufflerSpy!
    var deck: Deck!

    override func setUp() {
        super.setUp()
        deck = Deck.standardDeck()
        shuffler = ShufflerSpy()
        sut = AutomaticCardShuffler(deck: deck, shuffler: shuffler)
    }

    override func tearDown() {
        shuffler = nil
        sut = nil
        deck = nil
        super.tearDown()
    }

    func testDiscardingACardDoesNotShuffleShoe() {
        let p = Int(0.74 * Double(deck.cards.count))
        for i in 1 ... p {
            // Given
            let card = sut.deal()!

            // When
            sut.discard(card)

            // Then
            XCTAssertFalse(shuffler.shuffleCalled, "Should not shuffle Shoe")
            XCTAssertEqual(sut.discardBox.count, i, "Should add a card to discard box")
        }
    }

    func testDiscardingCardsDoesNotShuffleShoe() {
        // Given
        let p = Int(0.74 * Double(deck.cards.count))
        var cards: [Card] = []

        for _ in 1 ... p {
            cards.append(sut.deal()!)
        }

        // When
        sut.discard(cards)

        // Then
        XCTAssertFalse(shuffler.shuffleCalled, "Should not shuffle Shoe")
        XCTAssertEqual(sut.discardBox.count, p, "Should add a card to discard box")
    }

    func testDiscardingACardDoesNotShuffleShoeUntil75PercentOfCardsAreInDiscardBox() {
        // Given
        let p = Int(0.75 * Double(deck.cards.count))
        var cards: [Card] = []

        for _ in 1 ... p {
            cards.append(sut.deal()!)
        }

        for i in 0 ..< p - 1 {
            // When
            sut.discard(cards[i])

            // Then
            XCTAssertFalse(shuffler.shuffleCalled, "Should not shuffle Shoe")
            let expectedCount = i + 1
            XCTAssertEqual(sut.discardBox.count, expectedCount, "Should add a card to discard box")
        }
    }

    func testDiscardingCardsDoesNotShuffleShoeUntil75PercentOfCardsAreInDiscardBox() {
        // Given
        let p = Int(0.75 * Double(deck.cards.count))
        var cards: [Card] = []

        for _ in 1 ... p {
            cards.append(sut.deal()!)
        }

        _ = cards.removeLast()

        // When
        sut.discard(cards)

        // Then
        XCTAssertFalse(shuffler.shuffleCalled, "Should not shuffle Shoe")
        XCTAssertEqual(sut.discardBox.count, cards.count, "Should add a card to discard box")
    }

    func testDiscardingACardShufflesShoeWhen75PercentOfCardsAreInDiscardBox() {
        // Given
        let p = Int(0.75 * Double(deck.cards.count))

        for _ in 1 ... p - 1 {
            sut.discard(sut.deal()!)
            XCTAssertFalse(shuffler.shuffleCalled, "Should not shuffle Shoe")
        }
        let lastCard = sut.deal()!
        let expectedCards = sut.cards + sut.discardBox + [lastCard]

        // When
        sut.discard(lastCard)

        // Then
        XCTAssertTrue(sut.discardBox.isEmpty, "Should empty the discard box")
        XCTAssertTrue(shuffler.shuffleCalled, "Should use shuffler")
        XCTAssertEqual(shuffler.collectionForShuffling as? [Card], expectedCards,
                       "Should use cards from the shoe and discard box in the shuffler")
        XCTAssertEqual(sut.cards, shuffler.shuffledCollection as? [Card], "Should put cards from shuffler to the shoe")
    }

    func testDiscardingCardsShufflesShoeWhen75PercentOfCardsAreInDiscardBox() {
        // Given
        let p = Int(0.75 * Double(deck.cards.count))
        var cards: [Card] = []

        for _ in 1 ... p {
            cards.append(sut.deal()!)
        }

        let expectedCards = sut.cards + cards

        // When
        sut.discard(cards)

        // Then
        XCTAssertTrue(sut.discardBox.isEmpty, "Should empty the discard box")
        XCTAssertTrue(shuffler.shuffleCalled, "Should use shuffler")
        XCTAssertEqual(shuffler.collectionForShuffling as? [Card], expectedCards,
                       "Should use cards from the shoe and discard box in the shuffler")
        XCTAssertEqual(sut.cards, shuffler.shuffledCollection as? [Card], "Should put cards from shuffler to the shoe")
    }
}
