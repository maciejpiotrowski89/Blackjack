//
//  GameStateNavigatorSpy.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 19/4/19.
//

import PlayingCards
@testable import Blackjack

final class GameStateNavigatorSpy: GameStateNavigator {
    var state: GameState = .readyToPlay
    
    var navigatedToState: GameState?
    var navigatedToStateCount = 0
    func navigate(to state: GameState) {
        navigatedToStateCount += 1
        navigatedToState = state
        self.state = state
    }
}
