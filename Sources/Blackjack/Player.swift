import PlayingCards

public protocol HandPlaying {
    func playHand() throws
    func discardHand() throws -> [Card]
}

public protocol Player: AnyObject, ChipsManaging, HandPlaying {
    typealias GameDelegate = (Starting & PlayersTurnDelegate)
    var game: GameDelegate? { get set }
    var dealer: CardDealer? { get set }

    func bet(_: Chip)
    func clearBet()

    var hand: BettingHand? { get }
    func createHand(with cards: [Card], bet: UInt) throws

    func hit()
    func doubleDown()
    func stand()
}

public class PlayerImpl: Player {
    public var hand: BettingHand? { return playerHand }
    var playerHand: PlayerHand?
    public weak var game: Player.GameDelegate?
    public weak var dealer: CardDealer?

    public func bet(_ chip: Chip) {
        guard chipsValue >= chip.rawValue else { return }
        chipsValue -= chip.rawValue
        game?.bet(chip)
    }

    public func clearBet() {
        game?.resetBet()
    }

    public func createHand(with cards: [Card], bet: UInt) throws {
        guard cards.count == 2 else { throw GameError.cannotCreateHandFromCards(cards) }
        guard bet > 0 else { throw GameError.cannotBetZero }
        playerHand = PlayerHand(bet: bet, cards: cards)
    }

    public func playHand() throws {
        guard let hand = playerHand else { throw GameError.noHandToPlay }
        actOnOutcome(of: hand)
    }

    public func hit() {
        guard var hand = playerHand else { return }
        guard let card = try? dealer?.dealCard() else { return }
        hand.add(card: card)
        playerHand = hand
        actOnOutcome(of: hand)
    }

    public func doubleDown() {
        guard var hand = playerHand else { return }
        guard hand.cards.count == 2 else { return }
        guard chipsValue >= hand.bet else { return }
        game?.bet(hand.bet)
        chipsValue -= hand.bet
        hand.doubleBet()
        if hand.outcome == .doubled {
            playerHand = hand
            hit()
        }
    }

    public func stand() {
        guard var hand = playerHand else { return }
        hand.stand()
        playerHand? = hand
        actOnOutcome(of: hand)
    }

    public var chipsValue: UInt = 0

    public func receive(chips: UInt) {
        chipsValue += chips
    }

    public func discardHand() throws -> [Card] {
        guard let hand = playerHand else { throw GameError.noHandToDiscard }
        let cards = hand.cards
        playerHand = nil
        return cards
    }

    private func actOnOutcome(of hand: PlayerHand) {
        switch hand.outcome {
        case .bust, .blackjack, .stood:
            try? game?.finishPlayersTurn()
        default: return
        }
    }
}
