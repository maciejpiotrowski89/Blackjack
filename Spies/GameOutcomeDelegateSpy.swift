//
//  GameOutcomeDelegateSpy.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 30/4/19.
//

@testable import Blackjack
import PlayingCards

final class GameOutcomeDelegateSpy: GameOutcomeDelegate {
    var gameOutcome: GameOutcome?
    func game(_: Game, didFinishWithOutcome outcome: GameOutcome) {
        gameOutcome = outcome
    }
}
