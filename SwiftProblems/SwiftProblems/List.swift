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
