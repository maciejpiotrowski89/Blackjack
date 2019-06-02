//
//  DealerTests.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 22/4/19.
//

@testable import Blackjack
import PlayingCards
import XCTest

final class DealerTests: XCTestCase {
    var sut: DealerImpl!
    var game: DealerGameDelegateSpy!

    override func setUp() {
        super.setUp()
        sut = DealerImpl()
        game = DealerGameDelegateSpy()
        sut.game = game
        sut.cardDealer = game
    }

    override func tearDown() {
        sut = nil
        game = nil
        super.tearDown()
    }

    // MARK: Hand

    func testHasEmptyHand() {
        XCTAssertNil(sut.hand)
    }

    func testCreatingHandWithNoCards() {
        // Given
        let cards: [Card] = []

        // When
        XCTAssertThrowsError(try sut.createHand(with: cards))

        // Then
        XCTAssertNil(sut.hand)
    }

    func testCreatingHandWithOneCard() {
        // Given
        let cards: [Card] = [Card.sampleCard()]

        // When
        XCTAssertThrowsError(try sut.createHand(with: cards))

        // Then
        XCTAssertNil(sut.hand)
    }

    func testCreatingHandWithTwoCards() {
        // Given
        let cards: [Card] = [Card.sampleCard(), Card.sampleCard()]

        // When
        XCTAssertNoThrow(try sut.createHand(with: cards))

        // Then
        XCTAssertNotNil(sut.hand)
        XCTAssertEqual(sut.hand?.cards, cards)
    }

    func testCreatingHandWithManyCards() {
        // Given
        let cards: [Card] = Card.sample4()

        // When
        XCTAssertThrowsError(try sut.createHand(with: cards))

        // Then
        XCTAssertNil(sut.hand)
    }

    // MARK: Discarding hand

    func testDiscardingHandWithoutAHand() {
        // Given
        sut.dealerHand = nil

        // When
        XCTAssertThrowsError(try sut.discardHand())

        // Then
        XCTAssertNil(sut.hand)
    }

    func testDiscardingHandWhenThereIsAHand() {
        // Given
        let hand = DealerHand.sampleHand()
        sut.dealerHand = hand

        // When
        let cards = try! sut.discardHand()

        // Then
        XCTAssertNil(sut.hand)
        XCTAssertEqual(cards, hand.cards)
    }

    // MARK: Collecting a bet

    func testCollectingBet0() {
        // Given
        let bet: UInt = 0

        // When
        XCTAssertEqual(sut.betsWon, 0)
        sut.collect(bet: bet)

        // Then
        XCTAssertEqual(sut.betsWon, 0)
    }

    func testCollectingBet100() {
        // Given
        let bet: UInt = 100

        // When
        XCTAssertEqual(sut.betsWon, 0)
        sut.collect(bet: bet)

        // Then
        XCTAssertEqual(sut.betsWon, 100)
    }

    func testCollectingBetAFewTimes() {
        // Given
        let bet: UInt = 100
        let bet1: UInt = 50
        let bet2: UInt = 28

        // When
        XCTAssertEqual(sut.betsWon, 0)
        sut.collect(bet: bet)
        sut.collect(bet: bet1)
        sut.collect(bet: bet2)

        // Then
        XCTAssertEqual(sut.betsWon, 178)
    }

    // MARK: Playing a hand

    func testPlayHandWhenThereIsNoHand() {
        // Given
        sut.dealerHand = nil

        // When
        XCTAssertThrowsError(try sut.playHand())

        // Then
        XCTAssertFalse(game.dealCardCalled)
        XCTAssertFalse(game.finishDealersTurnCalled)
    }

    func testPlayHandGetsCard() {
        // Given
        let hand = DealerHand.sample12Hand()
        sut.dealerHand = hand

        // When
        XCTAssertNoThrow(try sut.playHand())

        // Then
        XCTAssertTrue(game.dealCardCalled)
    }

    func testPlayHandAddsCardToAHand() {
        // Given
        let hand = DealerHand.sample12Hand()
        sut.dealerHand = hand
        XCTAssertEqual(sut.dealerHand?.cards.count, 2)

        // When
        XCTAssertNoThrow(try sut.playHand())

        // Then
        XCTAssertEqual(sut.dealerHand?.cards.count, 3)
    }

    func testPlayHandGetsCardUntil17orMore() {
        // Given
        let hand = DealerHand.sample12Hand()
        sut.dealerHand = hand
        game.dealCardReturned = Card.sample(.two)

        // When
        XCTAssertNoThrow(try sut.playHand())

        // Then
        XCTAssertEqual(sut.dealerHand?.cards.count, 5)
        XCTAssertEqual(sut.dealerHand?.highValue, 18)
    }

    func testPlayHandGetsCardUntilBust() {
        // Given
        let hand = DealerHand.sample12Hand()
        sut.dealerHand = hand
        game.dealCardReturned = Card.sample(.ten)

        // When
        XCTAssertNoThrow(try sut.playHand())

        // Then
        XCTAssertEqual(sut.dealerHand?.cards.count, 3)
        XCTAssertEqual(sut.dealerHand?.highValue, 22)
    }

    func testPlayHandGetsCardUntil17orMoreFinishesDealersTurn() {
        // Given
        let hand = DealerHand.sample12Hand()
        sut.dealerHand = hand
        game.dealCardReturned = Card.sample(.two)

        // When
        XCTAssertNoThrow(try sut.playHand())

        // Then
        XCTAssertTrue(game.finishDealersTurnCalled)
    }

    func testPlayHandGetsCardUntilBustFinishesDealersTurn() {
        // Given
        let hand = DealerHand.sample12Hand()
        sut.dealerHand = hand
        game.dealCardReturned = Card.sample(.ten)

        // When
        XCTAssertNoThrow(try sut.playHand())

        // Then
        XCTAssertTrue(game.finishDealersTurnCalled)
    }
}
