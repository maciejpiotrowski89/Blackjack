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
            try assertState(state, expected: [.dealersTurn, .managingBets])
        case .dealersTurn:
            try assertState(state, expected: .managingBets)
        case .managingBets:
            try assertState(state, expected: .readyToPlay)
        }
        self.state = state
    }
    
    private func assertState(_ state: GameState,
                             expected expectedState: GameState) throws {
        guard state == expectedState else {
            throw GameError.impossibleStateTransition(from: self.state, to: state)
        }
    }
    
    private func assertState(_ state: GameState,
                             expected expectedStates: [GameState]) throws {
        guard expectedStates.contains(state) else {
            throw GameError.impossibleStateTransition(from: self.state, to: state)
        }
    }
}
