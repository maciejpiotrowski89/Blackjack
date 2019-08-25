@testable import Blackjack
import PlayingCards
import XCTest

final class GameDelegateSpy: PlayersTurnDelegate, CardDealer, Starting {
    enum Error: Swift.Error {
        case somethingWentWrong
    }

    var dealCardCalled = false
    var dealCardReturnValue: Card?
    func dealCard() throws -> Card {
        dealCardCalled = true
        return dealCardReturnValue ?? Card.sample()
    }

    var betChipCallCount: Int = 0
    var betChip: Chip?
    func bet(_ chip: Chip) {
        betChip = chip
        betChipCallCount += 1
    }

    var betChipsValue: UInt = 0
    func bet(_ chipsValue: UInt) {
        betChipsValue = chipsValue
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
        game = nil
        super.tearDown()
    }

    // MARK: Bet

    func testBet_ShoulCallDelegate() {
        // Given
        let chip: Chip = .ten
        sut.chipsValue = 100

        // When
        sut.bet(chip)

        // Then
        XCTAssertEqual(game.betChip, chip)
    }

    func testBet_CanCallDelegateMultipleTimes() {
        // Given
        let chips: [Chip] = [.ten, .thousand, .fifty]
        sut.chipsValue = 10000

        // When
        chips.forEach { sut.bet($0) }

        // Then
        XCTAssertEqual(game.betChipCallCount, chips.count)
    }

    func testBet_ShouldDecreaseChipsValue() {
        // Given
        let chip: Chip = .ten
        sut.chipsValue = 100

        // When
        sut.bet(chip)

        // Then
        XCTAssertEqual(sut.chipsValue, 90, "Should decrease player's chips stack")
    }

    func testBet_DoesntWorkForAmountsBiggerThanPlayersStack() {
        // Given
        let chip: Chip = .hundered
        sut.chipsValue = 10

        // When
        sut.bet(chip)

        // Then
        XCTAssertEqual(sut.chipsValue, 10)
    }

    func testBet_DoesntWorkForAmountsEqualToPlayersStack() {
        // Given
        let chip: Chip = .hundered
        sut.chipsValue = 100

        // When
        sut.bet(chip)

        // Then
        XCTAssertEqual(sut.chipsValue, 0)
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

    // MARK: Play Hand

    func testPlayHand_ShouldThrowAnError_WhenTheHandWasNotCreated() {
        // Given
        sut.playerHand = nil

        // When
        XCTAssertThrowsError(try sut.playHand())
    }

    func testPlayHand_ShouldThrowAnError_WhenThereIsAHandToPlay() {
        // Given
        sut.playerHand = PlayerHand.sampleHand()

        // When
        XCTAssertNoThrow(try sut.playHand())
    }

    func testPlayHand_ShouldFinishTheRound_WhenHandIsBlackjack() {
        // Given
        sut.playerHand = PlayerHand.sampleBlackjackHand()

        // When
        XCTAssertNoThrow(try sut.playHand())

        // Then
        XCTAssertTrue(game.finishPlayersTurnCalled)
    }

    // MARK: Hitting

    func testHit_DoesNothing_WhenTheHandWasNotCreated() {
        // Given
        sut.playerHand = nil

        // When
        sut.hit()

        // Then
        XCTAssertFalse(game.dealCardCalled)
    }

    func testHit_DoesNothing_WhenThereIsAHandToPlay() {
        // Given
        sut.playerHand = PlayerHand.sampleHand()

        // When
        sut.hit()

        // Then
        XCTAssertTrue(game.dealCardCalled)
    }

    func testHit_AppendsCardToHand() {
        // Given
        let hand = PlayerHand.sampleHand()
        sut.playerHand = hand
        XCTAssertEqual(hand.value, 6)
        game.dealCardReturnValue = Card(suit: .diamonds, rank: .seven)

        // When
        sut.hit()

        // Then
        XCTAssertEqual(sut.playerHand!.value, 13)
    }

    func testHit_FinishesPlayerRoundOnBust() {
        // Given
        let hand = PlayerHand.sample18Hand()
        sut.playerHand = hand
        XCTAssertEqual(hand.value, 18)
        game.dealCardReturnValue = Card(suit: .diamonds, rank: .six)

        // When
        sut.hit()

        // Then
        XCTAssertEqual(sut.playerHand!.value, 24)
        XCTAssertTrue(game.finishPlayersTurnCalled)
    }

    func testHit_FinishesPlayerRoundOnBlackjack() {
        // Given
        let hand = PlayerHand.sample18Hand()
        sut.playerHand = hand
        let card = Card(suit: .diamonds, rank: .three)
        game.dealCardReturnValue = card

        // When
        sut.hit()

        // Then
        XCTAssertEqual(sut.playerHand!.value, 21)
        XCTAssertTrue(game.finishPlayersTurnCalled)
    }

    // MARK: Standing

    func testStand_DoesNothing_WhenThereIsNoHand() {
        // Given
        sut.playerHand = nil

        // When
        sut.stand()

        // Then
        XCTAssertFalse(game.finishPlayersTurnCalled)
    }

    func testStand_With18ValueHand_FinishesTheRound() {
        // Given
        let hand = PlayerHand.sample18Hand()
        sut.playerHand = hand

        // When
        sut.stand()

        // Then
        XCTAssertEqual(sut.playerHand!.outcome, .stood)
        XCTAssertTrue(game.finishPlayersTurnCalled)
    }

    func testStand_WithSmallValueHand_FinishesTheRound() {
        // Given
        let hand = PlayerHand.sampleHand()
        sut.playerHand = hand
        XCTAssertEqual(hand.value, 6)

        // When
        sut.stand()

        // Then
        XCTAssertEqual(sut.playerHand!.outcome, .stood)
        XCTAssertTrue(game.finishPlayersTurnCalled)
    }

    // MARK: Receiving chips

    func testReceiveChips_DoesNothing_WhenReceivedChipsEquals0() {
        // Given
        let chips: UInt = 0

        // When
        sut.receive(chips: chips)

        // Then
        XCTAssertEqual(sut.chipsValue, 0)
    }

    func testReceiveChips_Adds15Chips_ToEmptyUsersStack() {
        // Given
        let chips: UInt = 15
        sut.chipsValue = 0

        // When
        sut.receive(chips: chips)

        // Then
        XCTAssertEqual(sut.chipsValue, 15)
    }

    func testReceiveChips_Adds15Chips_ToUsersStack() {
        // Given
        let chips: UInt = 15
        sut.chipsValue = 9

        // When
        sut.receive(chips: chips)

        // Then
        XCTAssertEqual(sut.chipsValue, 24)
    }

    // MARK: Discarding a hand

    func testDiscardHand_ThrowsAnError_WhenThereIsNoHand() {
        // Given
        sut.playerHand = nil

        // When
        XCTAssertThrowsError(try sut.discardHand())
    }

    func testDiscardHand_DoesNotThrowsAnError_WhenThereIsAHand() {
        // Given
        sut.playerHand = PlayerHand.sampleHand()

        // When
        XCTAssertNoThrow(try sut.discardHand())
    }

    func testDiscardHand_ReturnsCards_WhenThereIsAHand() {
        // Given
        sut.playerHand = PlayerHand(bet: 10, cards: [
            Card(suit: .hearts, rank: .two),
            Card(suit: .hearts, rank: .five),
            Card(suit: .hearts, rank: .two)
        ])

        // When
        let cards = try! sut.discardHand()

        // Then
        XCTAssertEqual(cards.count, 3)
    }

    func testDiscardHand_ClearsHand_WhenThereIsAHand() {
        // Given
        sut.playerHand = PlayerHand.sampleHand()

        // When
        _ = try? sut.discardHand()

        // Then
        XCTAssertNil(sut.hand)
        XCTAssertNil(sut.playerHand)
    }

    // MARK: Doubling down

    func testDoubleDown_DoesNothing_WhenThereIsNoHand() {
        // Given
        sut.playerHand = nil

        // When
        sut.doubleDown()

        // Then
        XCTAssertFalse(game.dealCardCalled)
        XCTAssertEqual(game.betChipsValue, 0)
    }

    func testDoubleDown_DoesNothing_WhenThereIsMoreThan2CardsInTheHand() {
        // Given
        let bet: UInt = 100
        sut.playerHand = PlayerHand(bet: bet, cards: [
            Card(suit: .hearts, rank: .two),
            Card(suit: .hearts, rank: .five),
            Card(suit: .hearts, rank: .five)
        ])
        sut.chipsValue = 1000

        // When
        sut.doubleDown()

        // Then
        XCTAssertFalse(game.dealCardCalled)
        XCTAssertEqual(game.betChipsValue, 0)
    }

    func testDoubleDown_GetsACard_WhenThereIsAHand() {
        // Given
        sut.playerHand = PlayerHand.sampleHand()
        sut.chipsValue = 1000

        // When
        sut.doubleDown()

        // Then
        XCTAssertTrue(game.dealCardCalled)
    }

    func testDoubleDown_DoublesTheWager() {
        // Given
        let bet: UInt = 100
        sut.playerHand = PlayerHand(bet: bet, cards: [
            Card(suit: .hearts, rank: .two),
            Card(suit: .hearts, rank: .five)
        ])
        sut.chipsValue = 100

        // When
        sut.doubleDown()

        // Then
        XCTAssertEqual(game.betChipsValue, bet)
        XCTAssertEqual(sut.chipsValue, 0)
    }

    func testDoubleDown_IsImpossibleWhenThereAreNoChips() {
        // Given
        let bet: UInt = 100
        sut.playerHand = PlayerHand(bet: bet, cards: [
            Card(suit: .hearts, rank: .two),
            Card(suit: .hearts, rank: .five)
        ])
        sut.chipsValue = 0

        // When
        sut.doubleDown()

        // Then
        XCTAssertEqual(game.betChipsValue, 0)
        XCTAssertEqual(sut.chipsValue, 0)
    }

    func testDoubleDown_IsImpossibleWhenTheWagerIsBiggerThanChipsOnTheStack() {
        // Given
        let bet: UInt = 100
        sut.playerHand = PlayerHand(bet: bet, cards: [
            Card(suit: .hearts, rank: .two),
            Card(suit: .hearts, rank: .five)
        ])
        sut.chipsValue = 10

        // When
        sut.doubleDown()

        // Then
        XCTAssertEqual(game.betChipsValue, 0)
        XCTAssertEqual(sut.chipsValue, 10)
    }

    // MARK: Splitting hand

    func testSplitHand() {
        // Given

        // When

        // Then
        XCTFail("Not implemented yet")
    }
}
