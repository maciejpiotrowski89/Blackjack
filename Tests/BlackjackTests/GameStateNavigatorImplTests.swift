//
//  GameStateNavigatorImplTests.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 19/4/19.
//

import XCTest
import PlayingCards
@testable import Blackjack

final class GameStateNavigatorImplTestsTests: XCTestCase {
    
    var sut: GameStateNavigatorImpl!
    
    override func setUp() {
        super.setUp()
        sut = GameStateNavigatorImpl()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    //MARK: Transitions from Ready to Play state
    func testNavigationFrom_ReadyToPlay_To_ReadyToPlay_Possible() {
        XCTAssertThrowsError(try sut.navigate(to: .readyToPlay))
        XCTAssertEqual(sut.state, .readyToPlay)
    }
    
    func testNavigationFrom_ReadyToPlay_To_PlayersTurn_ImPossible() {
        XCTAssertNoThrow(try sut.navigate(to: .playersTurn))
        XCTAssertEqual(sut.state, .playersTurn)
    }
    
    func testNavigationFrom_ReadyToPlay_To_DealersTurn_Impossible() {
        XCTAssertThrowsError(try sut.navigate(to: .dealersTurn))
        XCTAssertEqual(sut.state, .readyToPlay)
    }
    
    func testNavigationFrom_ReadyToPlay_To_ManagingBets_Possible() {
        XCTAssertThrowsError(try sut.navigate(to: .managingBets))
        XCTAssertEqual(sut.state, .readyToPlay)
    }
    
    //MARK: Transitions from Player's Turn state
    func testNavigationFrom_PlayersTurn_To_ReadyToPlay_Impossible() {
        try! sut.navigate(to: .playersTurn)
        XCTAssertThrowsError(try sut.navigate(to: .readyToPlay))
        XCTAssertEqual(sut.state, .playersTurn)
    }
    
    func testNavigationFrom_PlayersTurn_To_PlayersTurn_ImPossible() {
        try! sut.navigate(to: .playersTurn)
        XCTAssertThrowsError(try sut.navigate(to: .playersTurn))
        XCTAssertEqual(sut.state, .playersTurn)
    }
    
    func testNavigationFrom_PlayersTurn_To_DealersTurn_Possible() {
        try! sut.navigate(to: .playersTurn)
        XCTAssertNoThrow(try sut.navigate(to: .dealersTurn))
        XCTAssertEqual(sut.state, .dealersTurn)
    }
    
    func testNavigationFrom_PlayersTurn_To_ManagingBets_Possible() {
        try! sut.navigate(to: .playersTurn)
        XCTAssertNoThrow(try sut.navigate(to: .managingBets))
        XCTAssertEqual(sut.state, .managingBets)
    }
    
    //MARK: Transitions from Dealer's Turn state
    func testNavigationFrom_DealersTurn_To_ReadyToPlay_ImPossible() {
        try! sut.navigate(to: .playersTurn)
        try! sut.navigate(to: .dealersTurn)
        XCTAssertThrowsError(try sut.navigate(to: .readyToPlay))
        XCTAssertEqual(sut.state, .dealersTurn)
    }
    
    func testNavigationFrom_DealersTurn_To_PlayersTurn_ImPossible() {
        try! sut.navigate(to: .playersTurn)
        try! sut.navigate(to: .dealersTurn)
        XCTAssertThrowsError(try sut.navigate(to: .playersTurn))
        XCTAssertEqual(sut.state, .dealersTurn)
    }
    
    func testNavigationFrom_DealersTurn_To_DealersTurn_ImPossible() {
        try! sut.navigate(to: .playersTurn)
        try! sut.navigate(to: .dealersTurn)
        XCTAssertThrowsError(try sut.navigate(to: .dealersTurn))
        XCTAssertEqual(sut.state, .dealersTurn)
    }
    
    func testNavigationFrom_DealersTurn_To_ManagingBets_Possible() {
        try! sut.navigate(to: .playersTurn)
        try! sut.navigate(to: .dealersTurn)
        XCTAssertNoThrow(try sut.navigate(to: .managingBets))
        XCTAssertEqual(sut.state, .managingBets)
    }
    
    //MARK: Transitions from Managing Bets state
    func testNavigationFrom_ManagingBets_To_ReadyToPlay_Possible() {
        try! sut.navigate(to: .playersTurn)
        try! sut.navigate(to: .dealersTurn)
        try! sut.navigate(to: .managingBets)
        XCTAssertNoThrow(try sut.navigate(to: .readyToPlay))
        XCTAssertEqual(sut.state, .readyToPlay)
    }
    
    func testNavigationFrom_ManagingBets_To_PlayersTurn_ImPossible() {
        try! sut.navigate(to: .playersTurn)
        try! sut.navigate(to: .dealersTurn)
        try! sut.navigate(to: .managingBets)
        XCTAssertThrowsError(try sut.navigate(to: .playersTurn))
        XCTAssertEqual(sut.state, .managingBets)
    }
    
    func testNavigationFrom_ManagingBets_To_DealersTurn_ImPossible() {
        try! sut.navigate(to: .playersTurn)
        try! sut.navigate(to: .dealersTurn)
        try! sut.navigate(to: .managingBets)
        XCTAssertThrowsError(try sut.navigate(to: .dealersTurn))
        XCTAssertEqual(sut.state, .managingBets)
    }
    
    func testNavigationFrom_ManagingBets_To_ManagingBets_ImPossible() {
        try! sut.navigate(to: .playersTurn)
        try! sut.navigate(to: .dealersTurn)
        try! sut.navigate(to: .managingBets)
        XCTAssertThrowsError(try sut.navigate(to: .managingBets))
        XCTAssertEqual(sut.state, .managingBets)
    }
}
