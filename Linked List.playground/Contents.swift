import UIKit

/**
 +--------+    +--------+    +--------+    +--------+
 |            |    |            |    |            |    |           |
 | node 0 |--->| node 1 |--->| node 2 |--->| node 3 |---> nil
 |            |    |            |    |            |    |           |
 +--------+    +--------+    +--------+    +--------+
 ^                                                    ^
 |                                                     |
 Head                                             Tail
 
 */

class Node {
    let value: Int
    var next: Node?
    init(_ value: Int) {
        self.value = value
    }
}

class LinkedList {
    
    var head: Node?
    
    func append(for value: Int) {
        if head == nil {
            head = Node(value)
            return
        }
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = Node(value)
    }
    
    /** pre pend
            newHead -> head
            head = newHead
            [new head]->[head]->[]->[]
    */
    func prepend(_ value: Int) {
        let newHead = Node(value)
        newHead.next = head
        head = newHead
    }
    
    /** Delete with value
            headd == nil return
            current value == value then
            [current]      ->->     [] move to the next value
            [current]->[next]->[]
    */
    func deleteVWithValue(_ value: Int) {
        if head == nil {
            return
        }
        if head?.value == value { // if head is the value to delete, assign the value to the next node
            head = head?.next
            return
        }
        var current = head
        while current?.next != nil {
            if current?.next?.value == value {
                current?.next = current?.next?.next
                return
            }
            current = current?.next
        }
    }
    
    func reverseList(head: Node?) -> Node? {
        var current = head
        var prev: Node?
        var next: Node?
        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        return prev
    }
    
    func mergeTwoList(_ list1: Node?, list2: Node?) -> Node? {
        if list1 == nil && list2 == nil {
            return nil
        }
        var list1 = list1
        var list2 = list2
        var dummy = Node(-1)
        var current = dummy
        
        while list1 != nil && list2 != nil {
            
            if list1!.value < list2!.value {
                current.next = list1
                list1 = list1?.next
            } else {
                current.next = list2
                list2 = list2?.next
            }
            current = current.next!
        }
//        current.next = list1 != nil ? list1 : list2
        if list1 != nil {
            current.next = list1
        } else {
            current.next = list2
        }
        return dummy.next
    }
}

//struct LinkedList<T> {
//    var head: LinkedListNode<T>
//    init(head: LinkedListNode<T>) {
//        self.head = head
//    }
//}
//
//indirect enum LinkedListNode<T> {
//    case value(element: T, next: LinkedListNode<T>)
//    case end
//}
//
//let value3 = LinkedListNode.value(element: "C", next: .end)
//let value2 = LinkedListNode.value(element: "B", next: value3)
//let value1 = LinkedListNode.value(element: "A", next: value2)
//
//let list = LinkedList(head: value1)


