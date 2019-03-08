import PlayingCards

public struct Hand {
    static let Blackjack = 21
    
    public struct Option: OptionSet {
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        public let rawValue: Int
        public static let hit = Option(rawValue: 1 << 0)
        public static let stand = Option(rawValue: 1 << 1)
        public static let double = Option(rawValue: 1 << 2)
        public static let split = Option(rawValue: 1 << 3)
    }
    
    public enum Outcome: Equatable {
        case blackjack, playing, doubled, bust, stood
    }
    
    private var initialBet: Int
    public var bet: Int {
        return doubled ? initialBet * 2 : initialBet
    }
    
    public private(set) var cards: [Card]
    public init(bet: Int, cards: [Card] = []) {
        self.initialBet = bet
        self.cards = cards
    }
    
    public var value: Int {
        return outcome == .stood ?
            highValue :
            cards.reduce(0) { (result, card) -> Int in
                return result + card.blackjackValue
        }
    }
    
    public var highValue: Int {
        return cards.sorted(by: >).reduce(0) { (result, card) -> Int in
            if card.rank == .ace && result + card.highValue <= Hand.Blackjack  {
                return result + card.highValue
            }
            return result + card.blackjackValue
        }
    }
    
    public var options: Option {
        if  outcome == .blackjack ||
            outcome == .stood ||
            outcome == .bust ||
            outcome == .doubled {
            return []
        }
    
        if cards.count > 2 {
            return  [.hit, .stand]
        }
        if cards.count == 2 {
            if  cards[0].blackjackValue == cards[1].blackjackValue {
                return [.hit, .stand, .split, .double]
            }
            return [.hit, .stand, .double]
        }
        return  []
    }
    
    
    public var outcome: Outcome {
        if highValue == Hand.Blackjack {
            if cards.count == 2 {
                return .blackjack
            } else {
                return .stood
            }
        } else if highValue > Hand.Blackjack {
            return .bust
        } else if stood {
            return .stood
        } else if doubled {
            return .doubled
        }
        return .playing
    }
    
    public mutating func add(card: Card) {
        guard !stood else { return }
        cards.append(card)
        guard outcome == .doubled else { return }
        stand()
    }
    
    private var doubled = false
    public mutating func doubleDown() {
        guard cards.count == 2 else { return }
        doubled = true
    }

    private var stood = false
    public mutating func stand() {
        stood = true
    }
}

extension Hand: Comparable {
    public static func < (lhs: Hand, rhs: Hand) -> Bool {
        return false
    }
}

public class Dealer {
//    var hand: Hand
}

public class Player {
//    var hand: Hand
//    var hands: [Hand]
//    var chips: Int
}

public class Table {
    //    let dealer Dealer
    //    let player: Player
    //let shoe: Shoe
}
public class Blackjack {
    //let Table
}
