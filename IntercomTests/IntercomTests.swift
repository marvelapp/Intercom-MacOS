//
//  IntercomTests.swift
//  IntercomTests
//
//  Created by Maxime De Greve on 06/12/2018.
//  Copyright © 2018 Maxime De Greve. All rights reserved.
//

import XCTest
@testable import Intercom

class IntercomTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSetup() {

        let token = "MY TOKEN"
        Intercom.shared.setup(accessToken: token)

        XCTAssert(Intercom.shared.accessToken == token)
        XCTAssert(Intercom.shared.isSetup == true)

    }

}
