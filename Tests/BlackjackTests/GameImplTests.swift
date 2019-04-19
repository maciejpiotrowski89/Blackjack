//
//  GameImplTests.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 18/4/19.
//

import XCTest
import PlayingCards
@testable import Blackjack

final class GameImplTests: XCTestCase {
    
    var sut: GameImpl!
    var shoe: CardShoeSpy!
    var player: PlayerSpy!
    var stateNavigator: GameStateNavigatorSpy!

    override func setUp() {
        super.setUp()
        shoe = CardShoeSpy()
        player = PlayerSpy()
        stateNavigator = GameStateNavigatorSpy()
        sut = GameImpl(shoe: shoe,
                       player: player,
                       stateNavigator: stateNavigator)
    }

    override func tearDown() {
        sut = nil
        shoe = nil
        player = nil
        stateNavigator = nil
        super.tearDown()
    }
    
    //MARK: Betting & Reseting a bet
    func testBetChip() {
        //Given
        let chip = Chip.fifty
        
        //When
        sut.bet(chip)
        
        //Then
        XCTAssertEqual(sut.bet, 50)
        XCTAssertEqual(sut.state, .readyToPlay)
    }
    
    func testBetChips() {
        //Given
        let chip1 = Chip.ten
        let chip2 = Chip.fifty
        let chip3 = Chip.fiveHundered
        
        //When
        sut.bet(chip1)
        sut.bet(chip2)
        sut.bet(chip3)

        //Then
        XCTAssertEqual(sut.bet, 560)
        XCTAssertEqual(sut.state, .readyToPlay)
    }
    
    func testBettingIsImpossibleDuringTheRound() {
        //Given
        sut.bet(.ten)
        stateNavigator.state = .playersTurn
        
        //When
        sut.bet(.fifty)
        
        //Then
        XCTAssertEqual(sut.bet, 10)
        XCTAssertEqual(sut.state, .playersTurn)
        XCTAssertNil(player.receivedChips)
    }
    
    func testResetting() {
        //Given
        sut.bet(.ten)
        XCTAssertEqual(sut.bet, 10)

        //When
        sut.reset()
        
        //Then
        XCTAssertEqual(sut.bet, 0)
        XCTAssertEqual(sut.state, .readyToPlay)
        XCTAssertEqual(player.receivedChips, 10)
        
    }
    
    func testResettingIsImpossibleDuringTheRound() {
        //Given
        sut.bet(.ten)
        stateNavigator.state = .playersTurn

        //When
        sut.reset()
        
        //Then
        XCTAssertEqual(sut.bet, 10)
        XCTAssertEqual(sut.state, .playersTurn)
        XCTAssertNil(player.receivedChips)
    }
    
    //MARK: Playing
    func testPlayImpossibleIfThereIsNoBet() {
        //Given
        //no betting
        
        //When
        sut.play()
        
        //Then
        XCTAssertNil(stateNavigator.navigatedToState)
        
    }
    
    func testPlayChangesStateToPlayersTurn() {
        //Given
        shoe.prepareCards()
        sut.bet(.ten)
        
        //When
        sut.play()
        
        //Then
        XCTAssertEqual(stateNavigator.navigatedToState, .playersTurn)
    }
    
    func testPlayGets4CardsFromTheShoe() {
        //Given
        shoe.prepareCards()
        sut.bet(.ten)
        
        //When
        sut.play()
        
        //Then
        XCTAssertEqual(shoe.dealCount, 4)
    }
    
    func testPlayCannotBeStartedMultipleTimes() {
        //Given
        shoe.prepareCards()
        sut.bet(.ten)
        sut.play()
        stateNavigator.state = .playersTurn
        
        //When
        sut.play()

        //Then
        XCTAssertEqual(shoe.dealCount, 4)
        XCTAssertEqual(stateNavigator.navigatedToStateCount, 1)
    }
    
    func testPlayCreatesPlayersAndDealersHands() {
        //Given
        shoe.prepareCards()
        sut.bet(.ten)
        
        //When
        sut.play()
        
        //Then
        XCTAssertNotNil(player.playedHandWithCards)
        XCTAssertNotNil(sut.dealerHand)
    }
    
    func testPlayCreatesPlayersAndDealersHandsWithCorrectCards() {
        //Given
        let cards = shoe.prepareCards()
        sut.bet(.ten)
        
        //When
        sut.play()
        
        //Then
        XCTAssertEqual(player.playedHandWithCards?.count, 2)
        XCTAssertEqual(sut.dealerHand?.cards.count, 2)
        
        XCTAssertEqual(player.playedHandWithCards?.first, cards[0])
        XCTAssertEqual(sut.dealerHand?.cards.first, cards[1])
        XCTAssertEqual(player.playedHandWithCards?.last, cards[2])
        XCTAssertEqual(sut.dealerHand?.cards.last, cards[3])
    }
    
    func testPlay_WhenThereAreNoCardsInTheShoe() {
        //Given
        shoe.cards = []
        sut.bet(.ten)

        //When
        sut.play()

        //Then
        XCTAssertEqual(stateNavigator.navigatedToState, .cardShoeIsEmpty)
        XCTAssertNil(player.playedHandWithCards)
        XCTAssertNil(sut.dealerHand)

    }
}
