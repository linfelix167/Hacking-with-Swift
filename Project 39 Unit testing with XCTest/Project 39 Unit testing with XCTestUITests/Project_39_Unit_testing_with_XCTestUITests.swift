//
//  Project_39_Unit_testing_with_XCTestUITests.swift
//  Project 39 Unit testing with XCTestUITests
//
//  Created by Felix Lin on 8/25/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import XCTest

class Project_39_Unit_testing_with_XCTestUITests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testInitialStateIsCorrect() {
        let table = XCUIApplication().tables
        XCTAssertEqual(table.cells.count, 56, "There should be 56 rows initially")
    }
    
    func testUserFilteringByString() {
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
}
