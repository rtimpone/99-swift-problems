//
//  LinkedListTests.swift
//  SwiftProblemsTests
//
//  Created by Rob Timpone on 2/24/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import XCTest
@testable import SwiftProblems

class LinkedListInitTests: XCTestCase {
    
    func testInitEmptyList() {
        let list = List(Array<Int>())
        XCTAssertNil(list)
    }
    
    func testInitWithSingleValue() {
        let list = List(1)
        XCTAssertNotNil(list)
    }
    
    func testInitWithMultipleValue() {
        let list = List(1, 1, 2, 3, 5)
        XCTAssertNotNil(list)
    }
    
    func testInitWithSingleValueArray() {
        let list = List([1])
        XCTAssertNotNil(list)
    }
    
    func testInitWithMultiValueArray() {
        let list = List([1, 1, 2, 3, 5])
        XCTAssertNotNil(list)
    }
}

class P01Tests: XCTestCase {
    
    //MARK: P01 - Find the last element of a linked list
    
    
}
