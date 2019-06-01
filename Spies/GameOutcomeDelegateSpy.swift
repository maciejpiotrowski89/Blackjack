//
//  GameOutcomeDelegateSpy.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 30/4/19.
//

import PlayingCards
@testable import Blackjack

final class GameOutcomeDelegateSpy: GameOutcomeDelegate {
    
    var gameOutcome: GameOutcome?
    func game(_ game: Game, didFinishWithOutcome outcome: GameOutcome) {
        gameOutcome = outcome
    }

}
