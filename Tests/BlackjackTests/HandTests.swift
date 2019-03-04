//
//  HandTests.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 4/3/19.
//

import XCTest
@testable import Blackjack
import PlayingCards

class HandTests: XCTestCase {
  
    func testEmptyHand() {
        //Given:
        let bet = 100
        
        //When:
        let sut = Hand(bet: bet)

        //Then:
        XCTAssertEqual(sut.value, 0)
        XCTAssertEqual(sut.highValue, 0)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithOnly2CardsOfDifferentValue() {
        //Given:
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When:
        let sut = Hand(bet: bet, cards: cards)
        
        //Then:
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithOnly2CardsOfSameValue() {
        //Given:
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .hearts, rank: .jack),
            ]
        
        //When:
        let sut = Hand(bet: bet, cards: cards)
        
        //Then:
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }

}
