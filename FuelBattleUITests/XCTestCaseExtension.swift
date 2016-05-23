//
//  XCTestCaseExtension.swift
//  SaudeOdonto
//
//  Created by Henrique Morbin on 13/04/16.
//  Copyright © 2016 Porto Seguro. All rights reserved.
//

import XCTest

extension XCTestCase {
    
    func waitForKeyboard() {
        expectationForPredicate(Predicate.countEqual1, evaluatedWithObject: XCUIApplication().keyboards, handler: nil)
        waitForExpectationsWithTimeout(10, handler: nil)
    }
    
    func waitForElementExist(element: XCUIElement, timeout: NSTimeInterval = 5) {
        expectationForPredicate(Predicate.exists, evaluatedWithObject: element, handler: nil)
        waitForExpectationsWithTimeout(10, handler: nil)
    }
    
    func waitForElementNotExist(element: XCUIElement, timeout: NSTimeInterval = 5) {
        expectationForPredicate(Predicate.notExists, evaluatedWithObject: element, handler: nil)
        waitForExpectationsWithTimeout(10, handler: nil)
    }
    
}

struct Predicate {
    
    static let countEqual1 = NSPredicate(format: "count == 1")
    static let exists = NSPredicate(format: "exists == 1")
    static let notExists = NSPredicate(format: "exists == 0")
    
}