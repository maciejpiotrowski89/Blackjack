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
            try assertState(state, expected: .playersTurn)
        case .playersTurn:
            try assertState(state, expected: .dealersTurn)
        case .dealersTurn:
            try assertState(state, expected: .managingBets)
        case .managingBets:
            try assertState(state, expected: .readyToPlay)
        }
        self.state = state
    }
    
    private func assertState(_ state: GameState,
                             expected expectedState: GameState) throws {
        typealias Error = GameError
        guard state == expectedState else {
            throw Error.impossibleStateTransition(from: self.state, to: state)
            
        }
    }
}
