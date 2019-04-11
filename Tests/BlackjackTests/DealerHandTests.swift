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
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testOptionsForHandWithOnly2CardsOfSameValue() {
        //Given:
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .hearts, rank: .two),
            ]
        
        //When:
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)

        //Then:
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    //MARK: Ace with another card
    func testHandWithAceAce() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .ace),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 2)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithAceTwo() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .two),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 3)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithAceThree() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .three),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 4)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithAceFour() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .four),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 5)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithAceFive() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 6)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithAceSix() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithAceSeven() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .seven),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithAceEight() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .eight),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithAceNine() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .nine),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
        
    }
    
    func testHandWithAceTen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .ten),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.outcome, .blackjack)
        XCTAssertEqual(sut.options, [])
    }
    
    func testHandWithAceJack() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .jack),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.outcome, .blackjack)
        XCTAssertEqual(sut.options, [])
    }
    
    func testHandWithAceQueen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .queen),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.outcome, .blackjack)
        XCTAssertEqual(sut.options, [])
    }
    
    func testHandWithAceKing() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.outcome, .blackjack)
        XCTAssertEqual(sut.options, [])
    }
    
    //MARK: Two with another card
    func testHandWithTwoAce() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .ace),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 3)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTwoTwo() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .two),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 4)
        XCTAssertEqual(sut.highValue, 4)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTwoThree() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .three),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 5)
        XCTAssertEqual(sut.highValue, 5)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTwoFour() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .four),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 6)
        XCTAssertEqual(sut.highValue, 6)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTwoFive() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 7)
        XCTAssertEqual(sut.highValue, 7)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTwoSix() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 8)
        XCTAssertEqual(sut.highValue, 8)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTwoSeven() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .seven),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 9)
        XCTAssertEqual(sut.highValue, 9)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTwoEight() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .eight),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 10)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTwoNine() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .nine),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTwoTen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .ten),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTwoJack() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .jack),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTwoQueen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .queen),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTwoKing() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    //MARK: Three with another card
    func testHandWithThreeAce() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .ace),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 4)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithThreeTwo() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .two),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 5)
        XCTAssertEqual(sut.highValue, 5)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithThreeThree() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .three),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 6)
        XCTAssertEqual(sut.highValue, 6)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithThreeFour() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .four),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 7)
        XCTAssertEqual(sut.highValue, 7)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithThreeFive() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 8)
        XCTAssertEqual(sut.highValue, 8)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithThreeSix() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 9)
        XCTAssertEqual(sut.highValue, 9)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithThreeSeven() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .seven),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 10)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithThreeEight() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .eight),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithThreeNine() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .nine),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithThreeTen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .ten),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithThreeJack() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .jack),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithThreeQueen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .queen),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithThreeKing() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    //MARK: Four with another card
    func testHandWithFourAce() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .ace),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 5)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFourTwo() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 6)
        XCTAssertEqual(sut.highValue, 6)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFourThree() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .three),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 7)
        XCTAssertEqual(sut.highValue, 7)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFourFour() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .four),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 8)
        XCTAssertEqual(sut.highValue, 8)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFourFive() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 9)
        XCTAssertEqual(sut.highValue, 9)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFourSix() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 10)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFourSeven() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .seven),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFourEight() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .eight),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFourNine() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .nine),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFourTen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .ten),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFourJack() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .jack),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFourQueen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .queen),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFourKing() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    //MARK: Five with another card
    func testHandWithFiveAce() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ace),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 6)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFiveTwo() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 7)
        XCTAssertEqual(sut.highValue, 7)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFiveThree() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .three),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 8)
        XCTAssertEqual(sut.highValue, 8)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFiveFour() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 9)
        XCTAssertEqual(sut.highValue, 9)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFiveFive() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 10)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFiveSix() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFiveSeven() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .seven),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFiveEight() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .eight),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFiveNine() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .nine),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFiveTen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ten),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFiveJack() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .jack),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFiveQueen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .queen),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithFiveKing() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    //MARK: Six with another card
    func testHandWithSixAce() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .ace),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
        
    }
    
    func testHandWithSixTwo() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .two),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 8)
        XCTAssertEqual(sut.highValue, 8)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSixThree() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .three),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 9)
        XCTAssertEqual(sut.highValue, 9)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSixFour() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .four),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 10)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSixFive() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSixSix() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSixSeven() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .seven),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSixEight() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .eight),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSixNine() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .nine),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSixTen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .ten),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSixJack() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .jack),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSixQueen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .queen),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSixKing() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    //MARK: Seven with another card
    func testHandWithSevenAce() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .ace),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithSevenTwo() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .two),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 9)
        XCTAssertEqual(sut.highValue, 9)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSevenThree() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .three),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 10)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSevenFour() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .four),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSevenFive() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSevenSix() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSevenSeven() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .seven),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSevenEight() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .eight),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSevenNine() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .nine),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithSevenTen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .ten),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithSevenJack() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .jack),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithSevenQueen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .queen),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithSevenKing() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    //MARK: Eight with another card
    func testHandWithEightAce() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .ace),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithEightTwo() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .two),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 10)
        XCTAssertEqual(sut.highValue, 10)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithEightThree() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .three),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithEightFour() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .four),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithEightFive() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithEightSix() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithEightSeven() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .seven),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithEightEight() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .eight),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithEightNine() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .nine),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithEightTen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .ten),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithEightJack() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .jack),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithEightQueen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .queen),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithEightKing() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    //MARK: Nine with another card
    func testHandWithNineAce() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .ace),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithNineTwo() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .two),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 11)
        XCTAssertEqual(sut.options, [.hit, .stand])
        XCTAssertEqual(sut.outcome, .playing)
    }
    
    func testHandWithNineThree() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .three),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithNineFour() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .four),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithNineFive() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithNineSix() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithNineSeven() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .seven),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithNineEight() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .eight),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithNineNine() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .nine),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithNineTen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .ten),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithNineJack() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .jack),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithNineQueen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .queen),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithNineKing() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .nine),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    //MARK: Ten with another card
    func testHandWithTenAce() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .ace),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .blackjack)
    }
    
    func testHandWithTenTwo() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .two),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTenThree() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .three),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTenFour() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .four),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTenFive() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTenSix() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithTenSeven() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .seven),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithTenEight() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .eight),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithTenNine() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .nine),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithTenTen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .ten),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithTenJack() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .jack),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithTenQueen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .queen),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithTenKing() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    //MARK: Jack with another card
    func testHandWithJackAce() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .ace),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .blackjack)
    }
    
    func testHandWithJackTwo() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .two),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithJackThree() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .three),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithJackFour() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .four),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithJackFive() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithJackSix() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithJackSeven() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .seven),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithJackEight() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .eight),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithJackNine() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .nine),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithJackTen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .ten),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithJackJack() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .jack),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithJackQueen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .queen),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithJackKing() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .jack),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    //MARK: Queen with another card
    func testHandWithQueenAce() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ace),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .blackjack)
    }
    
    func testHandWithQueenTwo() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .two),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithQueenThree() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .three),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithQueenFour() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .four),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithQueenFive() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithQueenSix() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithQueenSeven() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .seven),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithQueenEight() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .eight),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithQueenNine() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .nine),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithQueenTen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ten),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithQueenJack() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .jack),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithQueenQueen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .queen),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithQueenKing() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    //MARK: King with another card
    func testHandWithKingAce() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .ace),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 11)
        XCTAssertEqual(sut.highValue, 21)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .blackjack)
    }
    
    func testHandWithKingTwo() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .two),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 12)
        XCTAssertEqual(sut.highValue, 12)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithKingThree() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .three),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 13)
        XCTAssertEqual(sut.highValue, 13)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithKingFour() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .four),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 14)
        XCTAssertEqual(sut.highValue, 14)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithKingFive() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithKingSix() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 16)
        XCTAssertEqual(sut.highValue, 16)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWithKingSeven() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .seven),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithKingEight() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .eight),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithKingNine() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .nine),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithKingTen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .ten),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithKingJack() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .jack),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithKingQueen() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .queen),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testHandWithKingKing() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        
        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
    }
    
    //MARK: Values of more than 2 cards
    func testHandWith3Cards() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(cards: cards)
        
        //Then
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.options, [.hit, .stand])
    }
    
    func testHandWith4Cards() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(cards: cards)

        //Then
        XCTAssertEqual(sut.value, 18)
        XCTAssertEqual(sut.highValue, 18)
    }
    
    func testHandWith5CardssWith2Aces() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ace),
        ]
        
        //When
        let sut = DealerHand(cards: cards)

        //Then
        XCTAssertEqual(sut.value, 19)
        XCTAssertEqual(sut.highValue, 19)
    }
    
    func testHandWith4CardsIncludingAce() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .four),
        ]
        
        //When
        let sut = DealerHand(cards: cards)

        //Then
        XCTAssertEqual(sut.value, 20)
        XCTAssertEqual(sut.highValue, 20)
    }
    
    func testHandWithValueOf21() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .two),
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .three),
            Card(suit: .clubs, rank: .five),
        ]
        
        //When
        let sut = DealerHand(cards: cards)

        //Then
        XCTAssertEqual(sut.value, 21)
        XCTAssertEqual(sut.highValue, 21)
    }
    
    //MARK: Bust
    func testBust1() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .two),
        ]
        
        //When
        let sut = DealerHand(cards: cards)

        //Then
        XCTAssertEqual(sut.value, 22)
        XCTAssertEqual(sut.highValue, 22)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .bust)
    }
    
    func testBust2() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .king),
            Card(suit: .diamonds, rank: .queen),
            Card(suit: .clubs, rank: .ten),
        ]
        
        //When
        let sut = DealerHand(cards: cards)

        //Then
        XCTAssertEqual(sut.value, 30)
        XCTAssertEqual(sut.highValue, 30)
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .bust)
    }
    
    //MARK: Auto - standing
    func testAutoStandAt17_1() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .six),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(cards: cards)
        
        //Then
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testAutoStandAt17_2() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .six),
        ]
        
        //When
        let sut = DealerHand(cards: cards)
        
        //Then
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testAutoStandAt17_3() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(cards: cards)
        
        //Then
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testAutoStandAt18() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(cards: cards)
        
        //Then
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testAutoStandAt19() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .king),
        ]
        
        //When
        let sut = DealerHand(cards: cards)
        
        //Then
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    func testAutoStandAt20() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .seven),
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
            Card(suit: .diamonds, rank: .six),
        ]
        
        //When
        let sut = DealerHand(cards: cards)
        
        //Then
        XCTAssertEqual(sut.outcome, .stood)
    }
    
    //MARK: Adding a card
    func testAddACard() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .six),
        ]
        var sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        let next = Card(suit: .hearts, rank: .two)
        
        //When
        sut.add(card: next)
        sut.add(card: next)
        
        //Then
        XCTAssertEqual(sut.options, [.hit, .stand])
        XCTAssertEqual(sut.outcome, .playing)
        XCTAssertEqual(sut.value, 15)
        XCTAssertEqual(sut.highValue, 15)
        XCTAssertEqual(sut.cards.count, 4)
    }
    
    func testCannotAddACardAfterStanding1() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .six),
        ]
        var sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        let next = Card(suit: .hearts, rank: .three)
        
        //When
        sut.add(card: next)
        sut.add(card: next)

        //Then
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.cards.count, 4)
    }
    
    func testCannotAddACardAfterStanding2() {
        //Given
        let cards = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .six),
        ]
        var sut = DealerHand(faceUp: cards.first!, faceDown: cards.last!)
        let next = Card(suit: .hearts, rank: .three)
        
        //When
        sut.add(card: next)
        sut.add(card: next)
        sut.add(card: next)
        
        //Then
        XCTAssertEqual(sut.options, [])
        XCTAssertEqual(sut.outcome, .stood)
        XCTAssertEqual(sut.value, 17)
        XCTAssertEqual(sut.highValue, 17)
        XCTAssertEqual(sut.cards.count, 4)
    }
    
    //MARK: Comparing 2 hands
    func testHandGreaterThanAnotherHand() {
        //Given
        let hand1 = DealerHand(cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
            ])
        let hand2 = DealerHand(cards: [
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
        let hand1 = DealerHand(cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
            ])
        let hand2 = DealerHand(cards: [
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
        let hand1 = DealerHand(cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
            ])
        let hand2 = DealerHand(cards: [
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
        let hand1 = DealerHand(cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
            ])
        let hand2 = DealerHand(cards: [
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
        let hand1 = DealerHand(cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
            ])
        let hand2 = DealerHand(cards: [
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
        let hand1 = DealerHand(cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
            ])
        let hand2 = DealerHand(cards: [
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
        let hand1 = DealerHand(cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
            ])
        let hand2 = DealerHand(cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
            ])
        
        //When
        let equal = hand2 != hand1
        
        //Then
        XCTAssertTrue(equal)
    }
}
