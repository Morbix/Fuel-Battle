//
//  FuelBattleUITests.swift
//  FuelBattleUITests
//
//  Created by Henrique Morbin on 21/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import XCTest

class FuelBattleUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let app = XCUIApplication()
        let navigation = app.navigationBars["Averages"]
        waitForElementExist(navigation)
        
        
        let loading = app.staticTexts["Loading..."]
        waitForElementExist(loading)
        waitForElementNotExist(loading)
        
        snapshot("0Main")
    }
    
}
