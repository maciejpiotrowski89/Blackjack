//
//  ShoeTests.swift
//  PlayingCardsTests
//
//  Created by Maciej Piotrowski on 28/2/19.
//

import XCTest
@testable import Blackjack
import PlayingCards

class CardShoeTests: XCTestCase {
    
    var shoe: CardShoe!
    
    override func tearDown() {
        super.tearDown()
        shoe = nil
    }
    
    func testShoeInitializedWith1StandardDeckHas52Cards() {
        //Given
        let deck = Deck.standardDeck()
        
        //When
        shoe = CardShoe(deck: deck)
        
        //Then
        XCTAssertEqual(shoe.cards, deck.cards)
    }
    
    func testShoeInitializedWithMultipleDecks() {
        //Given
        let deck = Deck.standardDeck()
        let decks = [deck, deck, deck]
        
        //When
        shoe = CardShoe(decks: decks)
        
        //Then
        XCTAssertEqual(shoe.cards.count, deck.cards.count * decks.count)
    }
    
    func testShoeWithMultipleDecks() {
        for i in 0...8 {
            //Given
            let n = i
            
            //When
            shoe = CardShoe.with(numberOfDecks: UInt(n))
            
            //Then
            XCTAssertEqual(shoe.cards.count, Deck.standardCount * n)
        }
    }
}
