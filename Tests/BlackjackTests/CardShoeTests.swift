//
//  ShoeTests.swift
//  PlayingCardsTests
//
//  Created by Maciej Piotrowski on 28/2/19.
//

import XCTest
@testable import Blackjack
import PlayingCards
import Shuffling

final class ShufflerSpy: Shuffling {
    var shuffleCalled = false
    var collectionForShuffling: Any?
    var shuffledCollection: Any?
    func shuffle<T: Collection>(_ collection: T) -> [T.Iterator.Element] {
        shuffleCalled = true
        collectionForShuffling = collection
        let shuffled = Array(collection).shuffled()
        shuffledCollection = shuffled
        return shuffled
    }
}

final class CardShoeTests: XCTestCase {
    
    var shoe: CardShoe!
    var shuffler: ShufflerSpy!
    var card: Card!
    
    override func setUp() {
        super.setUp()
        let deck = Deck.standardDeck()
        shuffler = ShufflerSpy()
        shoe = CardShoe(deck: deck, shuffler: shuffler)
        card = Card(suit: .clubs, rank: .ace)
    }
    
    override func tearDown() {
        shoe = nil
        card = nil
        super.tearDown()
    }
    
    func testShoeInitializedWith1StandardDeckHas52Cards() {
        //Given
        let deck = Deck.standardDeck()
        
        //When
        shoe = CardShoe(deck: deck)
        
        //Then
        XCTAssertEqual(shoe.cards, deck.cards, "Should have \(deck.cards.count) cards")
        XCTAssertEqual(shoe.discardBox.count, 0, "Should have an empty discard box")
    }
    
    func testShoeInitializedWithMultipleDecks() {
        //Given
        let deck = Deck.standardDeck()
        let decks = [deck, deck, deck]
        let expected = deck.cards.count * decks.count
        
        //When
        shoe = CardShoe(decks: decks)
        
        //Then
        XCTAssertEqual(shoe.cards.count, expected, "Should have \(expected) cards")
        XCTAssertEqual(shoe.discardBox.count, 0, "Should have an empty discard box")
    }
    
    func testShoeWithMultipleDecks() {
        for i in 0...8 {
            //Given
            let n = i
            let expected = Deck.standardCount * n
            
            //When
            shoe = CardShoe.with(numberOfDecks: UInt(n))
            
            //Then
            XCTAssertEqual(shoe.cards.count, expected, "Should have \(expected) cards")
            XCTAssertEqual(shoe.discardBox.count, 0, "Should have an empty discard box")
        }
    }
    
    func testStandardShoe() {
        //Given
        let n = 8
        
        //When
        shoe = CardShoe.standardShoe()
        
        //Then
        XCTAssertEqual(shoe.cards.count, Deck.standardCount * n, "Should contain \(n) decks")
        XCTAssertEqual(shoe.discardBox.count, 0, "Should have an empty discard box")
    }
    
    func testDealCardReturnsFirstCardFromTheShoe() {
        //Given
        let expectedCard = shoe.cards.first
        let expectedCount = shoe.cards.count - 1
        
        //When
        let card = shoe.deal()
        
        //Then
        XCTAssertEqual(card, expectedCard, "Should deal first card from the shoe")
        XCTAssertEqual(shoe.cards.count, expectedCount, "Should remove card from the shoe")
        XCTAssertEqual(shoe.discardBox.count, 0, "Should not put card to a discard box by itself")
    }
    
    func testDealCardDoesNotReturnACardIfItIsEmpty() {
        //Given
        XCTAssertFalse(shoe.cards.isEmpty)
        _ = shoe.removeAllCards()
        XCTAssertTrue(shoe.cards.isEmpty)

        //When
        let card = shoe.deal()

        //Then
        XCTAssertNil(card, "Should not deal any card")
    }
    
    func testDiscardingACard() {
        //Given
        XCTAssertTrue(shoe.discardBox.isEmpty)
        
        //When
        shoe.discard(card)
        
        //Then
        XCTAssertEqual(shoe.discardBox.first, card, "Should put card to a discard box")
    }
    
    func testDiscardingCards() {
        //Given
        XCTAssertTrue(shoe.discardBox.isEmpty)
        let cards = [card!, card!, card!]

        //When
        shoe.discard(cards)
        
        //Then
        XCTAssertEqual(shoe.discardBox.count, cards.count, "Should put cards to a discard box")
        XCTAssertEqual(shoe.discardBox, cards, "Should put cards to a discard box")
    }
    
    func testClearingDiscardBox() {
        //Given
        let expectedCard: Card = card
        shoe.discard(expectedCard)
        
        //When
        let cards = shoe.emptyDiscardBox()
        
        //Then
        XCTAssertTrue(shoe.discardBox.isEmpty, "Should remove cards from a discard box")
        XCTAssertEqual([expectedCard], cards)
        
    }
    
    func testFillingShoeFromDiscardBox() {
        //Given
        let expectedCount = shoe.cards.count + 1
        let expectedCard: Card = card
        shoe.discard(expectedCard)
        
        //When
        shoe.fillFromDiscardBox()
        
        //Then
        XCTAssertEqual(shoe.cards.last, expectedCard, "Should put cards from discard box back to the shoe")
        XCTAssertEqual(shoe.cards.count, expectedCount, "Should put cards from discard box back to the shoe")
        XCTAssertEqual(shoe.discardBox.count, 0, "Should empty discard box")
    }
    
    func testShufflingAddsCardsToShoe() {
        //Given
        let discarded = [Card(suit: .diamonds, rank: .ace),
                         Card(suit: .clubs, rank: .king),
                         Card(suit: .spades, rank: .queen),
                         Card(suit: .hearts, rank: .jack)]
        shoe.discard(discarded)
        let expectedCards = shoe.cards + discarded
        
        //When
        shoe.shuffleCards()
        
        //Then
        XCTAssertTrue(shoe.discardBox.isEmpty, "Should empty the discard box")
        XCTAssertTrue(shuffler.shuffleCalled, "Should use shuffler")
        XCTAssertEqual(shuffler.collectionForShuffling as? [Card], expectedCards, "Should use cards from the shoe and discard box in the shuffler")
        XCTAssertEqual(shoe.cards, shuffler.shuffledCollection as? [Card], "Should put cards from shuffler to the shoe")
    }
}
