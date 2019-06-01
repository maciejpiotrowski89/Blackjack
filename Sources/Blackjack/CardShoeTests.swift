//
//  ShoeTests.swift
//  PlayingCardsTests
//
//  Created by Maciej Piotrowski on 28/2/19.
//

import XCTest
import PlayingCards
@testable import Blackjack

final class CardShoeTests: XCTestCase {
    
    var sut: CardShoe!
    var shuffler: ShufflerSpy!
    var card: Card!
    
    override func setUp() {
        super.setUp()
        let deck = Deck.standardDeck()
        shuffler = ShufflerSpy()
        sut = CardShoe(deck: deck, shuffler: shuffler)
        card = Card(suit: .clubs, rank: .ace)
    }
    
    override func tearDown() {
        sut = nil
        card = nil
        super.tearDown()
    }
    
    func testShoeInitializedWith1StandardDeckHas52Cards() {
        //Given
        let deck = Deck.standardDeck()
        
        //When
        sut = CardShoe(deck: deck)
        
        //Then
        XCTAssertEqual(sut.cards, deck.cards, "Should have \(deck.cards.count) cards")
        XCTAssertEqual(sut.discardBox.count, 0, "Should have an empty discard box")
    }
    
    func testShoeInitializedWithMultipleDecks() {
        //Given
        let deck = Deck.standardDeck()
        let decks = [deck, deck, deck]
        let expected = deck.cards.count * decks.count
        
        //When
        sut = CardShoe(decks: decks)
        
        //Then
        XCTAssertEqual(sut.cards.count, expected, "Should have \(expected) cards")
        XCTAssertEqual(sut.discardBox.count, 0, "Should have an empty discard box")
    }
    
    func testShoeWithMultipleDecks() {
        for i in 0...8 {
            //Given
            let n = i
            let expected = Deck.standardCount * n
            
            //When
            sut = CardShoe.with(numberOfDecks: UInt(n))
            
            //Then
            XCTAssertEqual(sut.cards.count, expected, "Should have \(expected) cards")
            XCTAssertEqual(sut.discardBox.count, 0, "Should have an empty discard box")
        }
    }
    
    func testStandardShoe() {
        //Given
        let n = 6
        
        //When
        sut = CardShoe.standardShoe()
        
        //Then
        XCTAssertEqual(sut.cards.count, Deck.standardCount * n, "Should contain \(n) decks")
        XCTAssertEqual(sut.discardBox.count, 0, "Should have an empty discard box")
    }
    
    func testDealCardReturnsFirstCardFromTheShoe() {
        //Given
        let expectedCard = sut.cards.first
        let expectedCount = sut.cards.count - 1
        
        //When
        let card = sut.deal()
        
        //Then
        XCTAssertEqual(card, expectedCard, "Should deal first card from the shoe")
        XCTAssertEqual(sut.cards.count, expectedCount, "Should remove card from the shoe")
        XCTAssertEqual(sut.discardBox.count, 0, "Should not put card to a discard box by itself")
    }
    
    func testDealCardDoesNotReturnACardIfItIsEmpty() {
        //Given
        XCTAssertFalse(sut.cards.isEmpty)
        _ = sut.removeAllCards(from: \CardShoe.cards as! ReferenceWritableKeyPath<CardShoe, [Card]>)
        XCTAssertTrue(sut.cards.isEmpty)

        //When
        let card = sut.deal()

        //Then
        XCTAssertNil(card, "Should not deal any card")
    }
    
    func testDiscardingACard() {
        //Given
        XCTAssertTrue(sut.discardBox.isEmpty)
        
        //When
        sut.discard(card)
        
        //Then
        XCTAssertEqual(sut.discardBox.first, card, "Should put card to a discard box")
    }
    
    func testDiscardingCards() {
        //Given
        XCTAssertTrue(sut.discardBox.isEmpty)
        let cards = [card!, card!, card!]

        //When
        sut.discard(cards)
        
        //Then
        XCTAssertEqual(sut.discardBox.count, cards.count, "Should put cards to a discard box")
        XCTAssertEqual(sut.discardBox, cards, "Should put cards to a discard box")
    }
    
    func testClearingDiscardBox() {
        //Given
        let expectedCard: Card = card
        sut.discard(expectedCard)
        
        //When
        let cards = sut.emptyDiscardBox()
        
        //Then
        XCTAssertTrue(sut.discardBox.isEmpty, "Should remove cards from a discard box")
        XCTAssertEqual([expectedCard], cards)
        
    }
    
    func testFillingShoeFromDiscardBox() {
        //Given
        let expectedCount = sut.cards.count + 1
        let expectedCard: Card = card
        sut.discard(expectedCard)
        
        //When
        sut.fillFromDiscardBox()
        
        //Then
        XCTAssertEqual(sut.cards.last, expectedCard, "Should put cards from discard box back to the shoe")
        XCTAssertEqual(sut.cards.count, expectedCount, "Should put cards from discard box back to the shoe")
        XCTAssertEqual(sut.discardBox.count, 0, "Should empty discard box")
    }
    
    func testShufflingAddsCardsToShoe() {
        //Given
        let discarded = [Card(suit: .diamonds, rank: .ace),
                         Card(suit: .clubs, rank: .king),
                         Card(suit: .spades, rank: .queen),
                         Card(suit: .hearts, rank: .jack)]
        sut.discard(discarded)
        let expectedCards = sut.cards + discarded
        
        //When
        sut.shuffleCards()
        
        //Then
        XCTAssertTrue(sut.discardBox.isEmpty, "Should empty the discard box")
        XCTAssertTrue(shuffler.shuffleCalled, "Should use shuffler")
        XCTAssertEqual(shuffler.collectionForShuffling as? [Card], expectedCards, "Should use cards from the shoe and discard box in the shuffler")
        XCTAssertEqual(sut.cards, shuffler.shuffledCollection as? [Card], "Should put cards from shuffler to the shoe")
    }
}
