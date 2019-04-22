//
//  PlayerTests.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 22/4/19.
//

import XCTest
@testable import Blackjack

class PlayerTests: XCTestCase {
    
    var sut: PlayerImpl!
    
    override func setUp() {
        super.setUp()
        sut = PlayerImpl()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

}
