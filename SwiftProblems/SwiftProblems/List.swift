//
//  List.swift
//  SwiftProblems
//
//  Created by Rob Timpone on 2/24/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

class List<T> {
    
    var value: T?
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
