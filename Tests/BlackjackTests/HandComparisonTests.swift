//
//  HandComparisonTests.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 15/4/19.
//

import XCTest
@testable import Blackjack
import PlayingCards

class HandComparisonTests: XCTestCase {

    func testPlayerLowerDealerGreater_1() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = player == dealer
        let notEqual: Bool = player != dealer
        let greater: Bool = player > dealer
        let lower: Bool = player < dealer
        
        //Then
        XCTAssertFalse(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    func testPlayerLowerDealerGreater_2() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = dealer == player
        let notEqual: Bool = dealer != player
        let greater: Bool = dealer > player
        let lower: Bool = dealer < player
        
        //Then
        XCTAssertFalse(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    func testPlayerGreaterDealerLower_1() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ace),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = player == dealer
        let notEqual: Bool = player != dealer
        let greater: Bool = player > dealer
        let lower: Bool = player < dealer
        
        //Then
        XCTAssertFalse(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    func testPlayerGreaterDealerLower_2() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ace),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .two),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = dealer == player
        let notEqual: Bool = dealer != player
        let greater: Bool = dealer > player
        let lower: Bool = dealer < player
        
        //Then
        XCTAssertFalse(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(lower, "Player: \(player), Dealer: \(dealer)")
    }
    

    func testPlayerDealerEqual_1() {
        //Given
        let bet: UInt = 100
        let cards: [Card] = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ace),
        ]
        let player = PlayerHand(bet: bet, cards: cards)!
        let dealer = DealerHand(cards: cards)
        
        //When
        let equal: Bool = player == dealer
        let notEqual: Bool = player != dealer
        let greater: Bool = player > dealer
        let lower: Bool = player < dealer
        
        //Then
        XCTAssertTrue(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    func testPlayerDealerEqual_2() {
        //Given
        let bet: UInt = 100
        let cards: [Card] = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ace),
        ]
        let player = PlayerHand(bet: bet, cards: cards)!
        let dealer = DealerHand(cards: cards)
        
        //When
        let equal: Bool = dealer == player
        let notEqual: Bool = dealer != player
        let greater: Bool = dealer > player
        let lower: Bool = dealer < player
        
        //Then
        XCTAssertTrue(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    //MARK: Busted hands
    func testPlayerBustDealerOK_1() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ten),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = player == dealer
        let notEqual: Bool = player != dealer
        let greater: Bool = player > dealer
        let lower: Bool = player < dealer
        
        //Then
        XCTAssertFalse(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    func testPlayerBustDealerOK_2() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ten),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = dealer == player
        let notEqual: Bool = dealer != player
        let greater: Bool = dealer > player
        let lower: Bool = dealer < player
        
        //Then
        XCTAssertFalse(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    func testPlayerOKDealerBust_1() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ten),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = player == dealer
        let notEqual: Bool = player != dealer
        let greater: Bool = player > dealer
        let lower: Bool = player < dealer
        
        //Then
        XCTAssertFalse(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    func testPlayerOKDealerBust_2() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .four),
            Card(suit: .clubs, rank: .two),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ten),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = dealer == player
        let notEqual: Bool = dealer != player
        let greater: Bool = dealer > player
        let lower: Bool = dealer < player
        
        //Then
        XCTAssertFalse(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    func testPlayerBustDealerBust_1() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .queen),
            Card(suit: .diamonds, rank: .four),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ten),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = player == dealer
        let notEqual: Bool = player != dealer
        let greater: Bool = player > dealer
        let lower: Bool = player < dealer
        
        //Then
        XCTAssertTrue(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    func testPlayerBustDealerBust_2() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .queen),
            Card(suit: .diamonds, rank: .four),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .five),
            Card(suit: .clubs, rank: .ten),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = dealer == player
        let notEqual: Bool = dealer != player
        let greater: Bool = dealer > player
        let lower: Bool = dealer < player
        
        //Then
        XCTAssertTrue(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    //MARK: Blackjack and "21" hands
    
    func testPlayerHasBlackjackDealerHasBlackjack_1() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ace),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .king),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = player == dealer
        let notEqual: Bool = player != dealer
        let greater: Bool = player > dealer
        let lower: Bool = player < dealer
        
        //Then
        XCTAssertTrue(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    func testPlayerHasBlackjackDealerHasBlackjack_2() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ace),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .king),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = dealer == player
        let notEqual: Bool = dealer != player
        let greater: Bool = dealer > player
        let lower: Bool = dealer < player
        
        //Then
        XCTAssertTrue(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    func testPlayerHasBlackjackDealerHas21_1() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ace),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .queen),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = player == dealer
        let notEqual: Bool = player != dealer
        let greater: Bool = player > dealer
        let lower: Bool = player < dealer
        
        //Then
        XCTAssertFalse(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    func testPlayerHasBlackjackDealerHas21_2() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ace),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .queen),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = dealer == player
        let notEqual: Bool = dealer != player
        let greater: Bool = dealer > player
        let lower: Bool = dealer < player
        
        //Then
        XCTAssertFalse(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    func testPlayerHas21DealerHasBlackjack_1() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .queen),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ace),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = player == dealer
        let notEqual: Bool = player != dealer
        let greater: Bool = player > dealer
        let lower: Bool = player < dealer
        
        //Then
        XCTAssertFalse(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(lower, "Player: \(player), Dealer: \(dealer)")
    }
    
    func testPlayerHas21DealerHasBlackjack_2() {
        //Given
        let bet: UInt = 100
        let playerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ace),
            Card(suit: .clubs, rank: .queen),
        ]
        let dealerCards: [Card] = [
            Card(suit: .clubs, rank: .queen),
            Card(suit: .clubs, rank: .ace),
        ]
        let player = PlayerHand(bet: bet, cards: playerCards)!
        let dealer = DealerHand(cards: dealerCards)
        
        //When
        let equal: Bool = dealer == player
        let notEqual: Bool = dealer != player
        let greater: Bool = dealer > player
        let lower: Bool = dealer < player
        
        //Then
        XCTAssertFalse(equal, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(notEqual, "Player: \(player), Dealer: \(dealer)")
        XCTAssertTrue(greater, "Player: \(player), Dealer: \(dealer)")
        XCTAssertFalse(lower, "Player: \(player), Dealer: \(dealer)")
    }
}
