//
//  DealerHand.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 9/3/19.
//

import XCTest
@testable import Blackjack
import PlayingCards

class DealerHandTests: XCTestCase {
    
    //MARK: Hand
    func testHand() {
        //Given:
        let faceUp: Card = Card(suit: .diamonds, rank: .three)
        let faceDown: Card = Card(suit: .clubs, rank: .king)
        
        //When:
        let sut = DealerHand(faceUp: faceUp, faceDown: faceDown)
        
        //Then:
        XCTAssertEqual(sut.faceUpCard, faceUp)
        XCTAssertEqual(sut.cards, [faceUp, faceDown])
        XCTAssertEqual(sut.bet, 0)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testOptionsForHandWithOnly2CardsOfSameValue() {
        //Given:
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .hearts, rank: .jack),
            ]
        
        //When:
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)

        //Then:
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    //can only [.hit, .stand]
    //auto stand at 17+
    //bust over 21

}
