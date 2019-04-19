//
//  GameStateNavigator.swift
//  Blackjack
//
//  Created by Maciej Piotrowski on 19/4/19.
//

public enum GameState {
    case readyToPlay, playersTurn, dealersTurn, managingBets
}

public protocol GameStateNavigator {
    func navigate(to state: GameState) throws
    var state: GameState { get }
}

public final class GameStateNavigatorImpl: GameStateNavigator {
    public private(set) var state: GameState = .readyToPlay
    public func navigate(to state: GameState) throws {
        switch self.state {
        case .readyToPlay:
            guard state == .playersTurn else { throw GameError.impossibleStateTransition }
        case .playersTurn:
            guard state == .dealersTurn else { throw GameError.impossibleStateTransition }
        case .dealersTurn:
            guard state == .managingBets else { throw GameError.impossibleStateTransition }
        case .managingBets:
            guard state == .readyToPlay else { throw GameError.impossibleStateTransition }
        }
        self.state = state
    }
}
