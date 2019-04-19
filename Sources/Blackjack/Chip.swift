//
//  Chip.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 16/4/19.
//

import Foundation

public enum Chip: UInt {
    case ten = 10, fifty = 50, hundered = 100, fiveHundered = 500, thousand = 1000, fiveThousand = 5000
}

public  protocol ChipsManaging {
    var chipsValue: UInt { get }
    mutating func receive(chips: UInt)
}
