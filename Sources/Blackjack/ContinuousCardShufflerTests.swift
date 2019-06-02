//
//  ContinuousCardShufflerTests.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 4/3/19.
//

import XCTest
import PlayingCards
@testable import Blackjack

final class ContinuousCardShufflerTests: XCTestCase {

    var sut: ContinuousCardShuffler!
    var shuffler: ShufflerSpy!

    override func setUp() {
        super.setUp()
        let deck = Deck.standardDeck()
        shuffler = ShufflerSpy()
        sut = ContinuousCardShuffler(deck: deck, shuffler: shuffler)
    }

    override func tearDown() {
        shuffler = nil
        sut = nil
        super.tearDown()
    }

    func testDiscardingCardsShufflesEntireShoe() {
        //Given
        let discarded = [Card(suit: .diamonds, rank: .ace),
                         Card(suit: .clubs, rank: .king),
                         Card(suit: .spades, rank: .queen),
                         Card(suit: .hearts, rank: .jack)]
        let expectedCards = sut.cards + discarded

        //When
        sut.discard(discarded)

        //Then
        XCTAssertTrue(sut.discardBox.isEmpty, "Should empty the discard box")
        XCTAssertTrue(shuffler.shuffleCalled, "Should use shuffler")
        XCTAssertEqual(shuffler.collectionForShuffling as? [Card], expectedCards,
                       "Should use cards from the shoe and discard box in the shuffler")
        XCTAssertEqual(sut.cards, shuffler.shuffledCollection as? [Card], "Should put cards from shuffler to the shoe")
    }

    func testDiscardingACardShufflesEntireShoe() {
        //Given
        let discarded = Card(suit: .diamonds, rank: .ace)
        let expectedCards = sut.cards + [discarded]

        //When
        sut.discard(discarded)

        //Then
        XCTAssertTrue(sut.discardBox.isEmpty, "Should empty the discard box")
        XCTAssertTrue(shuffler.shuffleCalled, "Should use shuffler")
        XCTAssertEqual(shuffler.collectionForShuffling as? [Card], expectedCards,
                       "Should use cards from the shoe and discard box in the shuffler")
        XCTAssertEqual(sut.cards, shuffler.shuffledCollection as? [Card], "Should put cards from shuffler to the shoe")
    }

}
