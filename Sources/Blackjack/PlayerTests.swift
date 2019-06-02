//
//  PlayerTests.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 22/4/19.
//

@testable import Blackjack
import PlayingCards
import XCTest

final class GameDelegateSpy: PlayersTurnDelegate, CardDealer, Starting {
    enum Error: Swift.Error {
        case somethingWentWrong
    }

    func dealCard() throws -> Card {
        return Card.sample()
    }

    var betChipCallCount: Int = 0
    var betChip: Chip?
    func bet(_ chip: Chip) {
        betChip = chip
        betChipCallCount += 1
    }

    var resetCalled: Bool = false
    func resetBet() {
        resetCalled = true
    }

    var shouldThrowOnStart: Bool = false
    var startCalled: Bool = false
    func start() throws {
        guard !shouldThrowOnStart else { throw Error.somethingWentWrong }
        startCalled = true
    }

    var finishPlayersTurnCalled: Bool = false
    func finishPlayersTurn() throws {
        finishPlayersTurnCalled = true
    }
}

final class PlayerTests: XCTestCase {
    var sut: PlayerImpl!
    var game: GameDelegateSpy!

    override func setUp() {
        super.setUp()
        sut = PlayerImpl()
        game = GameDelegateSpy()
        sut.game = game
        sut.dealer = game
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Bet

    func testBet_ShoulCallDelegate() {
        // Given
        let chip: Chip = .ten

        // When
        sut.bet(chip)

        // Then
        XCTAssertEqual(game.betChip, chip)
    }

    func testBet_CanCallDelegateMultipleTimes() {
        // Given
        let chips: [Chip] = [.ten, .thousand, .fifty]

        // When
        chips.forEach { sut.bet($0) }

        // Then
        XCTAssertEqual(game.betChipCallCount, chips.count)
    }

    // MARK: Reset

    func testClearBet() {
        // Given
        // Nothing

        // When
        sut.clearBet()

        // Then
        XCTAssertTrue(game.resetCalled)
    }

    // MARK: Start game

    func testStartGame() {
        // Given
        game.shouldThrowOnStart = false

        // When
        XCTAssertNoThrow(try sut.startGame())

        // Then
        XCTAssertTrue(game.startCalled)
    }

    func testStartGame_ShouldRethrowErrorFromGame() {
        // Given
        game.shouldThrowOnStart = true

        // When
        XCTAssertThrowsError(try sut.startGame())

        // Then
        XCTAssertFalse(game.startCalled)
    }

    // MARK: Create hand

    func testCreateHand_with0Bet_ShouldFail() {
        // Given
        let bet: UInt = 0
        let cards: [Card] = Card.sample2()

        // When
        XCTAssertThrowsError(try sut.createHand(with: cards, bet: bet))

        // Then
        XCTAssertNil(sut.hand)
    }

    func testCreateHand_ShouldFail_withNoCards() {
        // Given
        let bet: UInt = 1
        let cards: [Card] = []

        // When
        XCTAssertThrowsError(try sut.createHand(with: cards, bet: bet))

        // Then
        XCTAssertNil(sut.hand)
    }

    func testCreateHand_ShouldFail_with1Card() {
        // Given
        let bet: UInt = 1
        let cards: [Card] = [Card.sample()]

        // When
        XCTAssertThrowsError(try sut.createHand(with: cards, bet: bet))

        // Then
        XCTAssertNil(sut.hand)
    }

    func testCreateHand_ShouldFail_with3Cards() {
        // Given
        let bet: UInt = 1
        let cards: [Card] = [Card.sample()]

        // When
        XCTAssertThrowsError(try sut.createHand(with: cards, bet: bet))

        // Then
        XCTAssertNil(sut.hand)
    }

    func testCreateHand_ShouldSucceed_with2Cards_andProperBet() {
        // Given
        let bet: UInt = 1
        let cards: [Card] = Card.sample2()

        // When
        XCTAssertNoThrow(try sut.createHand(with: cards, bet: bet))

        // Then
        XCTAssertNotNil(sut.hand)
    }

    /*
     func playHand()
     func hit()
     func doubleDown()
     func stand() {
     func receive(chips: UInt)
     func discardHand() throws -> [Card]
     */
}
