import PlayingCards

public struct Hand: Comparable {
    public static func < (lhs: Hand, rhs: Hand) -> Bool {
        return false
    }
    
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
    public enum Outcome {
        case blackjack, playing, bust, stood(Int), doubled(Int)
    }
    public private(set) var bet: Int
    public private(set) var cards: [Card]
    public var value: Int { return 0 }
    public var highValue: Int { return 0 }
    public var options: Option { return  [.hit, .stand, .double, .split] }
    public var outcome: Outcome { return .playing }
    public mutating func add(card: Card) {
//        cards.append(card)
    }
    
    public init(bet: Int, cards: [Card] = []) {
        self.bet = bet
        self.cards = cards
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
