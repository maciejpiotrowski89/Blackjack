//import PlayingCards
//
//struct Hand {
//    struct Option: OptionSet {
//        let rawValue: Int
//        static let hit = Option(rawValue: 1 << 0)
//        static let stand = Option(rawValue: 1 << 1)
//        static let double = Option(rawValue: 1 << 2)
//        static let split = Option(rawValue: 1 << 3)
//    }
//    enum Outcome {
//        case blackjack, playing, bust, stood(Int), doubled(Int)
//    }
//    private(set) var cards: [Card]
//    var value: Int { return 0 }
//    var highValue: Int { return 0 }
//    var options: Option { return  [.hit, .stand, .double, .split] }
//    var outcome: Outcome { return .playing }
//    mutating func add(card: Card) {
////        cards.append(card)
//    }
//}
//
//
//class Dealer {
////    var hand: Hand
//}
//
//class Player {
////    var hand: Hand
////    var hands: [Hand]
//}
//
//class Blackjack {
////    let dealer Dealer
////    let player: Player
//    //let shoe: Shoe
//}
