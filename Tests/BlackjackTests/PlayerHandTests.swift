//
//  PlayerHandTests.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 4/3/19.
//

import XCTest
@testable import Blackjack
import PlayingCards

class PlayerHandTests: XCTestCase {
    
    //MARK: Hand
    func testAnEmptyHand() {
        //Given:
        let bet = 100
        
        //When:
        let sut = PlayerHand(bet: bet)

        //Then:
        XCTAssertEqual(sut.value, 0)
        XCTAssertEqual(sut.highValue, 0)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
    }
    
    func testBetOfAHand() {
        //Given:
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When:
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then:
        XCTAssertEqual(sut.bet, bet)
    }
    
    func testOptionsForHandWith1Card() {
        //Given:
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            ]
        
        //When:
        let sut = PlayerHand(bet: bet, cards: cards)

        //Then:
        XCTAssertEqual(sut.options, [])
    }
    
    func testOptionsForHandWithOnly2CardsOfDifferentValue() {
        //Given:
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When:
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then:
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testOptionsForHandWithOnly2CardsOfSameValue() {
        //Given:
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .hearts, rank: .jack),
            ]
        
        //When:
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then:
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWith3CardsCanHitOrStand() {
        //Given:
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .hearts, rank: .two),
            Card(suit: .hearts, rank: .three),
            ]
        
        //When:
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then:
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithAnAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)

        //Then
        XCTAssertEqual(sut.value, 1)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
    }
    
    //MARK: Ace with another card
    func testHandWithAceAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 2)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithAceTwo() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 3)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithAceThree() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .three),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 4)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithAceFour() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .four),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 5)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithAceFive() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 6)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithAceSix() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .six),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 7)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithAceSeven() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .seven),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 8)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithAceEight() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .eight),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 9)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithAceNine() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .nine),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithAceTen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .ten),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.outcome, .blackjack)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
    }
    
    func testHandWithAceJack() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .jack),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.outcome, .blackjack)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
    }
    
    func testHandWithAceQueen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .queen),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.outcome, .blackjack)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
    }
    
    func testHandWithAceKing() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .king),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.outcome, .blackjack)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
    }
    
    //MARK: Two with another card
    func testHandWithTwoAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 3)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTwoTwo() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 4)
        XCTAssertEqual(sut.highValue, 4)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithTwoThree() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .three),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 5)
        XCTAssertEqual(sut.highValue, 5)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTwoFour() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .four),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 6)
        XCTAssertEqual(sut.highValue, 6)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTwoFive() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 7)
        XCTAssertEqual(sut.highValue, 7)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTwoSix() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .six),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 8)
        XCTAssertEqual(sut.highValue, 8)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTwoSeven() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .seven),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 9)
        XCTAssertEqual(sut.highValue, 9)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTwoEight() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .eight),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 10)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTwoNine() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .nine),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTwoTen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .ten),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTwoJack() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .jack),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTwoQueen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .queen),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTwoKing() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .king),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Three with another card
    func testHandWithThreeAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 4)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithThreeTwo() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 5)
        XCTAssertEqual(sut.highValue, 5)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithThreeThree() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .three),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 6)
        XCTAssertEqual(sut.highValue, 6)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithThreeFour() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .four),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 7)
        XCTAssertEqual(sut.highValue, 7)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithThreeFive() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 8)
        XCTAssertEqual(sut.highValue, 8)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithThreeSix() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .six),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 9)
        XCTAssertEqual(sut.highValue, 9)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithThreeSeven() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .seven),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 10)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithThreeEight() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .eight),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithThreeNine() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .nine),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithThreeTen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .ten),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithThreeJack() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .jack),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithThreeQueen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .queen),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithThreeKing() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .king),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Four with another card
    func testHandWithFourAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 5)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFourTwo() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 6)
        XCTAssertEqual(sut.highValue, 6)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFourThree() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .three),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 7)
        XCTAssertEqual(sut.highValue, 7)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFourFour() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .four),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 8)
        XCTAssertEqual(sut.highValue, 8)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithFourFive() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 9)
        XCTAssertEqual(sut.highValue, 9)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFourSix() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .six),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 10)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFourSeven() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .seven),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFourEight() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .eight),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFourNine() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .nine),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFourTen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .ten),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFourJack() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .jack),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFourQueen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .queen),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFourKing() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .king),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Five with another card
    func testHandWithFiveAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 6)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFiveTwo() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 7)
        XCTAssertEqual(sut.highValue, 7)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFiveThree() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .three),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 8)
        XCTAssertEqual(sut.highValue, 8)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFiveFour() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 9)
        XCTAssertEqual(sut.highValue, 9)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFiveFive() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 10)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithFiveSix() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .six),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFiveSeven() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .seven),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFiveEight() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .eight),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFiveNine() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .nine),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFiveTen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ten),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFiveJack() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .jack),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFiveQueen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .queen),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithFiveKing() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .king),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Six with another card
    func testHandWithSixAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 7)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSixTwo() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 8)
        XCTAssertEqual(sut.highValue, 8)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSixThree() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .three),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 9)
        XCTAssertEqual(sut.highValue, 9)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSixFour() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .four),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 10)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSixFive() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSixSix() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .six),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithSixSeven() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .seven),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSixEight() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .eight),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSixNine() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .nine),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSixTen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .ten),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSixJack() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .jack),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSixQueen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .queen),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSixKing() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .king),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Seven with another card
    func testHandWithSevenAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 8)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSevenTwo() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 9)
        XCTAssertEqual(sut.highValue, 9)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSevenThree() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .three),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 10)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSevenFour() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .four),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSevenFive() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSevenSix() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .six),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSevenSeven() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .seven),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithSevenEight() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .eight),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSevenNine() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .nine),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSevenTen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .ten),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSevenJack() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .jack),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSevenQueen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .queen),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithSevenKing() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .king),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Eight with another card
    func testHandWithEightAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 9)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithEightTwo() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 10)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithEightThree() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .three),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithEightFour() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .four),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithEightFive() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithEightSix() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .six),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithEightSeven() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .seven),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithEightEight() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .eight),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithEightNine() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .nine),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithEightTen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .ten),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithEightJack() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .jack),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithEightQueen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .queen),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithEightKing() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .king),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Nine with another card
    func testHandWithNineAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithNineTwo() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithNineThree() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .three),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithNineFour() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .four),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithNineFive() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithNineSix() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .six),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithNineSeven() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .seven),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithNineEight() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .eight),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithNineNine() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .nine),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithNineTen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .ten),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithNineJack() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .jack),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithNineQueen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .queen),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithNineKing() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .king),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Ten with another card
    func testHandWithTenAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .blackjack)
    }
    
    func testHandWithTenTwo() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTenThree() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .three),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTenFour() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .four),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTenFive() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTenSix() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .six),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTenSeven() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .seven),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTenEight() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .eight),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTenNine() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .nine),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithTenTen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .ten),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithTenJack() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .jack),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithTenQueen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .queen),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithTenKing() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .king),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    //MARK: Jack with another card
    func testHandWithJackAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .blackjack)
    }
    
    func testHandWithJackTwo() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithJackThree() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .three),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithJackFour() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .four),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithJackFive() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithJackSix() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .six),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithJackSeven() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .seven),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithJackEight() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .eight),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithJackNine() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .nine),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithJackTen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .ten),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithJackJack() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .jack),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithJackQueen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .queen),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithJackKing() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .king),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    //MARK: Queen with another card
    func testHandWithQueenAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .blackjack)
    }
    
    func testHandWithQueenTwo() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithQueenThree() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .three),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithQueenFour() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .four),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithQueenFive() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithQueenSix() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .six),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithQueenSeven() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .seven),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithQueenEight() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .eight),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithQueenNine() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .nine),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithQueenTen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ten),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithQueenJack() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .jack),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithQueenQueen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .queen),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithQueenKing() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .king),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    //MARK: King with another card
    func testHandWithKingAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .blackjack)
    }
    
    func testHandWithKingTwo() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithKingThree() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .three),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithKingFour() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .four),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithKingFive() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithKingSix() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .six),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithKingSeven() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .seven),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithKingEight() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .eight),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithKingNine() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .nine),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    func testHandWithKingTen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .ten),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithKingJack() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .jack),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithKingQueen() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .queen),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    func testHandWithKingKing() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .king),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    
    //MARK: Values of more than 2 cards
    func testHandWith3Cards() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .king),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWith4Cardss() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWith5CardssWith2Aces() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWith4CardsIncludingAce() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .four),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithValueOf21() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .five),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 21)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    //MARK: Bust
    func testBust1() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .two),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 22)
        XCTAssertEqual(sut.highValue, 22)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .bust)
    }
    
    func testBust2() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .diamonds, rank: .queen),
            Card(suit: .clubs, rank: .ten),
            ]
        
        //When
        let sut = PlayerHand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 30)
        XCTAssertEqual(sut.highValue, 30)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .bust)
    }
    
    //MARK: Standing
    func testStand() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .six),
            ]
        var sut = PlayerHand(bet: bet, cards: cards)
        
        //When
        sut.stand()
        
        //Then
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    //MARK: Adding a card
    func testAddACard() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .six),
            ]
        var sut = PlayerHand(bet: bet, cards: cards)
        let next = Card(suit: .hearts, rank: .three)
        
        //When
        sut.add(card: next)
        sut.add(card: next)

        //Then
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand])
        XCTAssertEqual(sut.cards.count, 4)
    }
    
    func testCannotAddACardAfterStanding1() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .six),
            ]
        var sut = PlayerHand(bet: bet, cards: cards)
        let next = Card(suit: .hearts, rank: .three)
        
        //When
        sut.stand()
        sut.add(card: next)
        
        //Then
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.cards.count, 2)
    }
    
    func testCannotAddACardAfterStanding2() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .six),
            ]
        var sut = PlayerHand(bet: bet, cards: cards)
        let next = Card(suit: .hearts, rank: .three)
        
        //When
        sut.add(card: next)
        sut.stand()
        sut.add(card: next)
        
        //Then
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.cards.count, 3)
    }
    
    func testStandReturnsHighValueAsValue() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .three),
            ]
        var sut = PlayerHand(bet: bet, cards: cards)
        
        //When
        sut.stand()
        
        //Then
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
    }
    
    //MARK: Doubling the bet
    func testDoubleDownDoublesTheBet() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .six),
            ]
        var sut = PlayerHand(bet: bet, cards: cards)
        
        //When
        sut.doubleBet()
        
        //Then
        XCTAssertEqual(sut.bet, 2 * bet)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .doubled)
    }
    
    func testDoubleDownAllowsAddingOneCard() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .six),
            ]
        var sut = PlayerHand(bet: bet, cards: cards)
        let next = Card(suit: .hearts, rank: .three)
        
        //When
        sut.doubleBet()
        sut.add(card: next)
        
        //Then
        XCTAssertEqual(sut.bet, 2 * bet)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
        XCTAssertEqual(sut.cards.count, 3)
    }
    
    func testDoubleDownAllowsAddingOnlyOneCard() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .six),
            ]
        var sut = PlayerHand(bet: bet, cards: cards)
        let next = Card(suit: .hearts, rank: .three)

        //When
        sut.doubleBet()
        sut.add(card: next)
        sut.add(card: next)

        //Then
        XCTAssertEqual(sut.bet, 2 * bet)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
        XCTAssertEqual(sut.cards.count, 3)
    }
    
    func testDoubleDownCanBeDoneOnlyOnAHandConsistingOfTwoCards() {
        //Given
        let bet = 200
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
            ]
        var sut = PlayerHand(bet: bet, cards: cards)
        
        //When
        sut.doubleBet()
        
        //Then
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand])
        XCTAssertEqual(sut.outcome, .playing)
    }
    
    //MARK: Comparing 2 hands
    func testHandGreaterThanAnotherHand() {
        //Given
        let hand1 = PlayerHand(bet: 100, cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
            ])
        let hand2 = PlayerHand(bet: 100, cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
            ])
        
        //When
        let greater = hand1 > hand2
        let less = hand1 < hand2

        //Then
        XCTAssertTrue(greater)
        XCTAssertFalse(less)
    }
    
    func testEqualHands1() {
        //Given
        let hand1 = PlayerHand(bet: 100, cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
            ])
        let hand2 = PlayerHand(bet: 100, cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
            ])
        
        //When
        let equal = hand1 == hand2
        
        //Then
        XCTAssertTrue(equal)
    }
    
    func testEqualHands2() {
        //Given
        let hand1 = PlayerHand(bet: 100, cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
            ])
        let hand2 = PlayerHand(bet: 100, cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
            ])
        
        //When
        let equal = hand2 == hand1
        
        //Then
        XCTAssertTrue(equal)
    }
    
    func testHandsAreNotEqual1() {
        //Given
        let hand1 = PlayerHand(bet: 100, cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
            ])
        let hand2 = PlayerHand(bet: 100, cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
            ])
        
        //When
        let equal = hand1 == hand2
        
        //Then
        XCTAssertFalse(equal)
    }
    
    func testHandsAreNotEqual2() {
        //Given
        let hand1 = PlayerHand(bet: 100, cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
            ])
        let hand2 = PlayerHand(bet: 100, cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
            ])
        
        //When
        let equal = hand2 == hand1
        
        //Then
        XCTAssertFalse(equal)
    }
    
    func testHandsAreNotEqual3() {
        //Given
        let hand1 = PlayerHand(bet: 100, cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
            ])
        let hand2 = PlayerHand(bet: 100, cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
            ])
        
        //When
        let equal = hand1 != hand2
        
        //Then
        XCTAssertTrue(equal)
    }
    
    func testHandsAreNotEqual4() {
        //Given
        let hand1 = PlayerHand(bet: 100, cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
            ])
        let hand2 = PlayerHand(bet: 100, cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
            ])
        
        //When
        let equal = hand2 != hand1
        
        //Then
        XCTAssertTrue(equal)
    }
}