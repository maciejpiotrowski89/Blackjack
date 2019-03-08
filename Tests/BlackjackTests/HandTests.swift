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
    
    func testAnEmptyHand() {
        //Given:
        let bet = 100
        
        //When:
        let sut = Hand(bet: bet)

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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)

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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)

        //Then
        XCTAssertEqual(sut.value, 1)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
    }
    
    //MARK: Ace
    func testHandWithAceAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.outcome, .blackjack)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [])
    }
    
    //MARK: Two
    func testHandWithTwoAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Three
    func testHandWithThreeAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Four
    func testHandWithFourAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Five
    func testHandWithFiveAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Six
    func testHandWithSixAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Seven
    func testHandWithSevenAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Eight
    func testHandWithEightAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Nine
    func testHandWithNineAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double])
    }
    
    //MARK: Ten
    func testHandWithTenAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    //MARK: Jack
    func testHandWithJackAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    //MARK: Queen
    func testHandWithQueenAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
    //MARK: King
    func testHandWithKingAce() {
        //Given
        let bet = 100
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .ace),
            ]
        
        //When
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
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
        let sut = Hand(bet: bet, cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.bet, bet)
        XCTAssertEqual(sut.options, [.hit, .stand, .double, .split])
    }
    
}
