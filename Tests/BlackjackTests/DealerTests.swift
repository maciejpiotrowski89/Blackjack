//
//  DealerTests.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 22/4/19.
//

import XCTest
@testable import Blackjack

class DealerTests: XCTestCase {

    var sut: DealerImpl!
    
    override func setUp() {
        super.setUp()
        sut = DealerImpl()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

}
