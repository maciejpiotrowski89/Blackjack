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
        case blackjack, playing, bust, stood(Int), doubled(Int)
    }
    public private(set) var bet: Int
    public private(set) var cards: [Card]
    public var value: Int {
        return cards.reduce(0) { (result, card) -> Int in
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
            outcome == .stood(Hand.Blackjack) ||
            outcome == .bust {
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
                return .stood(Hand.Blackjack)
            }
        } else if highValue > Hand.Blackjack {
            return .bust
        }
        return .playing
    }
    public mutating func add(card: Card) {
//        cards.append(card)
    }
    
    public init(bet: Int, cards: [Card] = []) {
        self.bet = bet
        self.cards = cards
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
