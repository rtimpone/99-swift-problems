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

class EqualityTests: XCTestCase {
    
    func testSingleItemListEquality() {
        
        let list = List(1)
        
        let matchingList = List(1)
        XCTAssertEqual(list, matchingList)
        
        let nonMatchingList1 = List(2)
        let nonMatchingList2 = List(1, 2)
        XCTAssertNotEqual(list, nonMatchingList1)
        XCTAssertNotEqual(list, nonMatchingList2)
    }
    
    func testDoubleItemListEquality() {
        
        let list = List(1, 2)
        
        let matchingList = List(1, 2)
        XCTAssertEqual(list, matchingList)
        
        let nonMatchingList1 = List(1)
        let nonMatchingList2 = List(2, 1)
        let nonMatchingList3 = List(1, 2, 3)
        XCTAssertNotEqual(list, nonMatchingList1)
        XCTAssertNotEqual(list, nonMatchingList2)
        XCTAssertNotEqual(list, nonMatchingList3)
    }
    
    func testMultiItemListEquality() {
        
        let list = List(1, 1, 2, 3, 5)
        
        let matchingList = List(1, 1, 2, 3, 5)
        XCTAssertEqual(list, matchingList)
        
        let nonMatchingList1 = List(1)
        let nonMatchingList2 = List(1, 1, 2, 3, 5, 8)
        let nonMatchingList3 = List(1, 1, 2, 3)
        
        XCTAssertNotEqual(list, nonMatchingList1)
        XCTAssertNotEqual(list, nonMatchingList2)
        XCTAssertNotEqual(list, nonMatchingList3)
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

class P03Tests: XCTestCase {
    
    //MARK: P03 - Find the kth element of a linked list
    
    func testSubscriptForSingleItemList() {
        let list = List(1)!
        XCTAssertEqual(list[0], 1)
        XCTAssertNil(list[1])
    }
    
    func testSubscriptForDoubleItemList() {
        let list = List(2, 3)!
        XCTAssertEqual(list[0], 2)
        XCTAssertEqual(list[1], 3)
        XCTAssertNil(list[2])
    }
    
    func testSubscriptForManyItemList() {
        let list = List(1, 1, 2, 3, 5)!
        XCTAssertEqual(list[0], 1)
        XCTAssertEqual(list[1], 1)
        XCTAssertEqual(list[2], 2)
        XCTAssertEqual(list[3], 3)
        XCTAssertEqual(list[4], 5)
        XCTAssertNil(list[5])
    }
}

class P04Tests: XCTestCase {
    
    //MARK: P04 - Find the number of items in a linked list
    
    func testFindLengthOfSingleItemList() {
        let list = List(1)
        let length = list?.length
        XCTAssertEqual(length, 1)
    }
    
    func testFindLengthOfDoubleItemList() {
        let list = List(1, 2)
        let length = list?.length
        XCTAssertEqual(length, 2)
    }
    
    func testFindLengthOfMultiItemList() {
        let list = List(1, 1, 2, 3, 5)
        let length = list?.length
        XCTAssertEqual(length, 5)
    }
}

class P05Tests: XCTestCase {

//MARK: P05 - Reverse a linked list

    func testReverseSingleItemList() {
        let list = List(1)
        list?.reverse()
        let expectedResult = List(1)
        XCTAssertEqual(list, expectedResult)
    }
    
    func testReverseDoubleItemList() {
        let list = List(1, 2)
        list?.reverse()
        let expectedResult = List(2, 1)
        XCTAssertEqual(list, expectedResult)
    }
    
    func testReverseMultiItemList() {
        let list = List(1, 1, 2, 3, 5)
        list?.reverse()
        let expectedResult = List(5, 3, 2, 1, 1)
        XCTAssertEqual(list, expectedResult)
    }
}

class P06Tests: XCTestCase {

    //MARK: P06 - Determine whether a linked list is a palindrome or not
    
    func testIsPalindromeForSingleItemList() {
        let list = List(1)!
        XCTAssertTrue(list.isPalindrome())
    }
    
    func testIsPalindromeForDoubleItemList() {
        
        let palindromicList = List(1, 1)!
        XCTAssertTrue(palindromicList.isPalindrome())
        
        let nonPalindromicList = List(1, 2)!
        XCTAssertFalse(nonPalindromicList.isPalindrome())
    }
    
    func testIsPalindromeForMultiItemList() {
        
        let palindromicList1 = List(1, 2, 2, 1)!
        XCTAssertTrue(palindromicList1.isPalindrome())
        
        let palindromicList2 = List(1, 1, 2, 1, 1)!
        XCTAssertTrue(palindromicList2.isPalindrome())
        
        let palindromicList3 = List(1, 2, 3, 2, 1)!
        XCTAssertTrue(palindromicList3.isPalindrome())
        
        let nonPalindromicList1 = List(1, 2, 3, 1)!
        XCTAssertFalse(nonPalindromicList1.isPalindrome())
        
        let nonPalindromicList2 = List(1, 2, 2, 7, 1)!
        XCTAssertFalse(nonPalindromicList2.isPalindrome())
        
        let nonPalindromicList3 = List(5, 9, 3, 4, 6)!
        XCTAssertFalse(nonPalindromicList3.isPalindrome())
    }
}

class P07Tests: XCTestCase {
    
    //MARK: P07 - Flatten a nested linked list
    
    func testFlattenSingleDepthList() {
        let list = List(1, 1, 2, 3, 5, 8)!
        let flattenedList = list.flatten()
        let expectedResult = List(1, 1, 2, 3, 5, 8)
        XCTAssertEqual(flattenedList, expectedResult)
    }
    
    func testFlattenDoubleDepthList() {
        let list: List<Any> = List(1, List(1, 2)!, 3, 5, 8)!
        let flattenedList = list.flatten()
        let flattenedListString = stringForListOfValues(fromList: flattenedList)
        let expectedResult = List(1, 1, 2, 3, 5, 8)!
        let expectedResultString = stringForListOfValues(fromList: expectedResult)
        XCTAssertEqual(flattenedListString, expectedResultString)
    }
    
    func testFlattenTripleDepthList() {
        let list: List<Any> = List(1, List<Any>(1, List(2, 3)!)!, 5, 8)!
        let flattenedList = list.flatten()
        let flattenedListString = stringForListOfValues(fromList: flattenedList)
        let expectedResult = List(1, 1, 2, 3, 5, 8)!
        let expectedResultString = stringForListOfValues(fromList: expectedResult)
        XCTAssertEqual(flattenedListString, expectedResultString)
    }
    
    func stringForListOfValues<T>(fromList list: List<T>) -> String {
        var valuesAsStrings = ["\(list.value)"]
        var currentList = list
        while let next = currentList.nextItem {
            let valueAsString = "\(next.value)"
            valuesAsStrings.append(valueAsString)
            currentList = next
        }
        return valuesAsStrings.joined(separator: ",")
    }
    
    func testStringForSingleItemList() {
        let list = List(1)!
        let valuesString = stringForListOfValues(fromList: list)
        XCTAssertEqual(valuesString, "1")
    }
    
    func testStringForDoubleItemList() {
        let list = List(1, 2)!
        let valuesString = stringForListOfValues(fromList: list)
        XCTAssertEqual(valuesString, "1,2")
    }
    
    func testStringForMultiItemList() {
        let list = List(1, 1, 2, 3, 5, 8)!
        let valuesString = stringForListOfValues(fromList: list)
        XCTAssertEqual(valuesString, "1,1,2,3,5,8")
    }
    
    func testStringForMultiItemListEquality() {
        let list = List(1, 1, 2, 3, 5, 8)!
        let matchingList = List(1, 1, 2, 3, 5, 8)!
        let listValuesAsString = stringForListOfValues(fromList: list)
        let matchingListValuesAsString = stringForListOfValues(fromList: matchingList)
        XCTAssertEqual(listValuesAsString, matchingListValuesAsString)
    }
}
