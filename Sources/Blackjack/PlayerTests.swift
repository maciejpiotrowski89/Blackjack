//
//  PlayerTests.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 22/4/19.
//

import XCTest
import PlayingCards
@testable import Blackjack

class PlayerTests: XCTestCase {
    
    var sut: PlayerImpl!
    
    override func setUp() {
        super.setUp()
        sut = PlayerImpl()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testCreateHand_with0Bet_shouldFail() {
        //Given
        let bet: UInt = 0
        let cards: [Card] = Card.sample2()
        
        //When
        XCTAssertThrowsError(try sut.createHand(with: cards, bet: bet))
        
        //Then
        XCTAssertNil(sut.hand)
    }

    func testCreateHand_shouldFail_withNoCards() {
        //Given
        let bet: UInt = 1
        let cards: [Card] = []
        
        //When
        XCTAssertThrowsError(try sut.createHand(with: cards, bet: bet))
        
        //Then
        XCTAssertNil(sut.hand)
    }
    
    func testCreateHand_shouldFail_with1Card() {
        //Given
        let bet: UInt = 1
        let cards: [Card] = [Card.sample()]
        
        //When
        XCTAssertThrowsError(try sut.createHand(with: cards, bet: bet))
        
        //Then
        XCTAssertNil(sut.hand)
    }
    
    func testCreateHand_shouldFail_with3Cards() {
        //Given
        let bet: UInt = 1
        let cards: [Card] = [Card.sample()]
        
        //When
        XCTAssertThrowsError(try sut.createHand(with: cards, bet: bet))
        
        //Then
        XCTAssertNil(sut.hand)
    }
    
    func testCreateHand_shouldSucceed_with2Cards_andProperBet() {
        //Given
        let bet: UInt = 1
        let cards: [Card] = Card.sample2()
        
        //When
        XCTAssertNoThrow(try sut.createHand(with: cards, bet: bet))
        
        //Then
        XCTAssertNotNil(sut.hand)
    }
    
    
}
