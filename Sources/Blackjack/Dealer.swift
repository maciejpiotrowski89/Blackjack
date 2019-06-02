//
//  Dealer.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 22/4/19.
//

import PlayingCards

public protocol Dealer: HandPlaying {
    var hand: Hand? { get }
    typealias GameDelegate = (CardDealer & DealersTurnDelegate)
    var delegate: GameDelegate? { get set }
    mutating func createHand(with cards: [Card]) throws
    mutating func collect(bet: UInt)
}

public final class DealerImpl: Dealer {

    var dealerHand: DealerHand?
    public var hand: Hand? { return dealerHand }
    public weak var delegate: Dealer.GameDelegate?

    public func createHand(with cards: [Card]) throws {
        guard cards.count == 2 else { throw GameError.cannotCreateHandFromCards(cards) }
        dealerHand = DealerHand(cards: cards)
    }

    public func playHand() throws {
        guard var hand = self.dealerHand else { throw GameError.noHandToPlay }
        repeat {
            guard let card = try delegate?.dealCard() else { throw GameError.cardShoeIsEmpty }
            hand.add(card: card)
        } while hand.outcome == .playing
        dealerHand = hand
        try delegate?.finishDealersTurn()
    }

    public func discardHand() throws -> [Card] {
        guard let hand = hand else { throw GameError.noHandToDiscard }
        defer { dealerHand = nil }
        return hand.cards
    }

    private(set) var betsWon: UInt = 0
    public func collect(bet: UInt) {
        betsWon += bet
    }

}
