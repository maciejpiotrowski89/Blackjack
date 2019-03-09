//
//  PlayOption.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 9/3/19.
//

import Foundation

public struct PlayOption: OptionSet {
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    public let rawValue: Int
    public static let hit = PlayOption(rawValue: 1 << 0)
    public static let stand = PlayOption(rawValue: 1 << 1)
    public static let double = PlayOption(rawValue: 1 << 2)
    public static let split = PlayOption(rawValue: 1 << 3)
    static let initial: PlayOption = [.hit, .stand, .double]
    static let pair: PlayOption = [.hit, .stand, .double, .split]
    static let standard: PlayOption = [.hit, .stand]
}
