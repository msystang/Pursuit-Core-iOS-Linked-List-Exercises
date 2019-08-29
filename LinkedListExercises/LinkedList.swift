//
//  LinkedList.swift
//  LinkedListExercises
//
//  Created by C4Q  on 10/24/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

public class Node<T> {
    var key: T
    var next: Node?
    var previous: Node?
    init(key: T) {
        self.key = key
    }
}

public class LinkedList<T: Equatable> {
    var head: Node<T>?
    
    func printAllKeys() {
        var currentNode = head
        while currentNode != nil {
            print(currentNode!.key)
            currentNode = currentNode?.next
        }
    }

    var count: Int {
        var count = 0
        var currentNode = head
        while currentNode != nil {
            currentNode = currentNode?.next
            count += 1
        }
        return count
    }
    
    func append(element newKey: T) {
        if head == nil {
            head = Node(key: newKey)
            return
        }
        var currentNode = head
        
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = Node(key: newKey)
    }
    
    func getNode(at index: Int) -> Node<T>? {
        guard index >= 0 else { return nil }
        var counter = 0
        var currentNode = head
        
        while counter < index {
            currentNode = currentNode?.next
            counter += 1
        }
        return currentNode
    }
    
    func contains(element targetKey: T) -> Bool {
        var currentNode = head
        
        while currentNode?.next != nil {
            if targetKey == currentNode?.key {
                return true
            }
            currentNode = currentNode?.next
        }
        return false
    }
    
    func equals(otherList: LinkedList<T>) -> Bool {
        var currentNode = head
        var otherCurrentNode = otherList.head
        
        guard self.count == otherList.count else { return false }
        
        while currentNode != nil {
            if currentNode!.key != otherCurrentNode!.key {
                return false
            }
            currentNode = currentNode!.next
            otherCurrentNode = otherCurrentNode!.next
        }
        return true
    }
    
    func toArr() -> [T] {
        var arr = [T]()
        var currentNode = head
        
        while currentNode != nil {
            if let currentNodeKey = currentNode?.key {
                arr.append(currentNodeKey)
            }
            currentNode = currentNode?.next
        }
        return arr
    }
    
    func reversed() {
        var previous: Node<T>?
        var currentNode = head
        var next = currentNode?.next
        
        while currentNode != nil {
            next = currentNode?.next
            currentNode?.next = previous
            previous = currentNode
            currentNode = next
        }
        head = previous

    }
    
    func removeAll() {
        head = nil
    }
    
    //Challenge Questions
    func removeDuplicatesFromSortedList() {}
    
    static func mergeSortedLists<T>(listOne: LinkedList<T>, listTwo: LinkedList<T>) -> LinkedList<T> {
        return LinkedList<T>()
    }
    
    


}

