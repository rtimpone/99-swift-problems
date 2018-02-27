//
//  LinkedListTests.swift
//  SwiftProblemsTests
//
//  Created by Rob Timpone on 2/24/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import XCTest
@testable import SwiftProblems

class InitTests: XCTestCase {
    
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
    
    func testFindLastWithOneItem() {
        let list = List(1)
        let last = list?.last
        XCTAssertEqual(last, 1)
    }
    
    func testFindLastWithTwoItems() {
        let list = List(1, 3)
        let last = list?.last
        XCTAssertEqual(last, 3)
    }
    
    func testFindLastWithManyItems() {
        let list = List(1, 1, 2, 3, 5)
        let last = list?.last
        XCTAssertEqual(last, 5)
    }
}

class P02Tests: XCTestCase {
    
    //MARK: P02 - Find the second to last element of a linked list
    
    func testFindPennultimateWithOneItem() {
        let list = List(1)
        let pennultimate = list?.pennultimate
        XCTAssertNil(pennultimate)
    }
    
    func testFindPennultimateWithTwoItems() {
        let list = List(2, 3)
        let pennultimate = list?.pennultimate
        XCTAssertEqual(pennultimate, 2)
    }
    
    func testFindPennultimateWithManyItems() {
        let list = List(1, 1, 2, 3, 5)
        let pennultimate = list?.pennultimate
        XCTAssertEqual(pennultimate, 3)
    }
}
