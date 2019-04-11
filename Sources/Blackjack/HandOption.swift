//
//  PlayOption.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 9/3/19.
//

import Foundation

public struct HandOption: OptionSet {
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    public let rawValue: Int
    public static let hit = HandOption(rawValue: 1 << 0)
    public static let stand = HandOption(rawValue: 1 << 1)
    public static let double = HandOption(rawValue: 1 << 2)
    public static let split = HandOption(rawValue: 1 << 3)
    static let initial: HandOption = [.hit, .stand, .double]
    static let pair: HandOption = [.hit, .stand, .double, .split]
    static let standard: HandOption = [.hit, .stand]
}
