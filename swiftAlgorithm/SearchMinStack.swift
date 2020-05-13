//
//  SearchMinStack.swift
//  swiftAlgorithm
//
//  Created by black on 2020/5/12.
//  Copyright © 2020 black. All rights reserved.
//

import UIKit

class SearchMinStack {
    
    var stack:Array<Int> = []
    var minStack: Array<Int> = []
    
    init() {
        
    }
    
    func push(_ x: Int) {
        stack.insert(0, at: 0)
        if minStack.count == 0 {
            minStack.append(x)
        } else {
            if x < minStack[0] {
                minStack.insert(x, at: 0)
            } else {
                minStack.insert(minStack[0], at: 0)
            }
        }
    }
    
    func pop() {
        guard stack.count > 0 else {
            return
        }
        stack.removeFirst()
        minStack.removeFirst()
    }
    
    func top() -> Int {
        guard stack.count > 0 else {
            return -999
        }
        return stack[0]
    }
    
    func getMin() -> Int {
        guard stack.count > 0 else {
            return -999
        }
        return minStack[0]
    }
    
}
