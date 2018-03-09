//
//  List.swift
//  SwiftProblems
//
//  Created by Rob Timpone on 2/24/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

class List<T> {
    
    var value: T
    var nextItem: List<T>?
    
    init?(_ values: [T]) {
        
        guard let first = values.first else {
            return nil
        }
        
        value = first
        
        let nextItemValues = values.suffix(from: 1)
        nextItem = List(Array(nextItemValues))
    }
    
    convenience init?(_ values: T...) {
        self.init(Array(values))
    }
}

extension List: Equatable where T: Equatable {
    
    static func ==(lhs: List<T>, rhs: List<T>) -> Bool {
        
        var leftList = lhs
        var rightList = rhs
        
        while leftList.value == rightList.value {
            
            if leftList.isLastItem && rightList.isLastItem {
                return true
            }
            
            guard let leftNextItem = leftList.nextItem, let rightNextItem = rightList.nextItem else {
                return false
            }
            
            leftList = leftNextItem
            rightList = rightNextItem
        }
        
        return false
    }
}

//MARK: P01 - Find the last element of a linked list

extension List {
    var last: T? {
        return nextItem?.last ?? value
    }
}

//MARK: P02 - Find the second to last element of a linked list

extension List {
    
    var isLastItem: Bool {
        return nextItem == nil
    }
    
    var pennultimate: T? {
        guard let next = nextItem else {
            return nil
        }
        return next.isLastItem ? value : next.pennultimate
    }
}

//MARK: P03 - Find the kth element of a linked list

extension List {
    
    subscript(index: Int) -> T? {

        var currentList = self
        
        for _ in 0..<index {
            guard let next = currentList.nextItem else {
                return nil
            }
            currentList = next
        }
        
        return currentList.value
    }
}

//MARK: P04 - Find the number of items in a linked list

extension List {
    
    var length: Int {
        
        var list = self
        var numberOfItems = 1
        
        while let next = list.nextItem {
            numberOfItems += 1
            list = next
        }
        
        return numberOfItems
    }
}

//MARK: P05 - Reverse a linked list

extension List {
    
    func reverse() {
        
        var currentList = self
        var tempList: List?
        
        while let nextList = currentList.nextItem {
    
            let newList = List(currentList.value)
            newList?.nextItem = tempList
            tempList = newList
            
            currentList = nextList
        }
        
        value = currentList.value
        nextItem = tempList
    }
}

//MARK: P06 - Determine whether a linked list is a palindrome or not

extension List {
    
    func allValues() -> [T] {
        
        var list = self
        var values = [value]
        
        while let next = list.nextItem {
            list = next
            values.append(list.value)
        }
        
        return values
    }
}

extension List where T: Equatable {
    
    func isPalindrome() -> Bool {
        
        let values = allValues()
        
        var leftIndex = 0
        var rightIndex = values.endIndex - 1
        
        while leftIndex < rightIndex {
            
            let leftValue = values[leftIndex]
            let rightValue = values[rightIndex]
            
            if leftValue != rightValue {
                return false
            }
            
            leftIndex += 1
            rightIndex -= 1
        }
        
        return true
    }
}

//MARK: P07 - Flatten a nested linked list

extension List {

    func flatten() -> List {

        var currentList = self
        var values = [T]()
        
        if let valueAsList = value as? List {
            let flattenedList = valueAsList.flatten()
            values.append(contentsOf: flattenedList.allValues())
        }
        else {
            values.append(value)
        }

        while let next = currentList.nextItem {

            currentList = next
            let currentValue = currentList.value
            
            if let valueAsList = currentValue as? List {
                let flattenedList = valueAsList.flatten()
                values.append(contentsOf: flattenedList.allValues())
            }
            else {
                values.append(currentValue)
            }
        }

        return List(values)!
    }
}
