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
    
    func reversereListRecursive(head: Node?) -> Node? {
        guard let head = head else {
            return nil
        }
        guard let nextNode = head.next else {
            return head
        }
        let reversedRestOfList = reversereListRecursive(head: nextNode)
        nextNode.next = head
        head.next = nil
        return reversedRestOfList
    }
    
    func reversedPrintList(_ head: Node?) {
        var stack: [Int] = []
        var current = head
        
        while let node = current {
            stack.append(node.value)
            current = node.next
        }
        while let value = stack.popLast() {
            print(value, terminator: " ")
        }
    }
    
    func reverePrintList(head: Node?) {
        guard let head = head else {
            return
        }
        reverePrintList(head: head.next)
        print(head.value, terminator: " ")
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
    
    // Insert new value in list
    func insertNewValueList(prev: Node?, newValue: Int) {
        if prev == nil {
            return
        }
        let newNode = Node(newValue)
        prev?.next = newNode
    }
    
    func getListLength(head:Node?) -> Int{
        var currentNode = head
        var count = 0
        while currentNode != nil {
            count = count + 1
            currentNode = currentNode?.next
        }
        return count
    }
    
    // Get the middle of the list using iteration
    func getMiddleOfList(head: Node?) -> Node? {
        var current = head
        let listLength = getListLength(head: current)
        var mid = listLength / 2
        while mid > 0 && current != nil {
            current = current?.next
            mid -= 1
        }
        return current
    }
    
    // Get the middle of the list using fast node pointer
    func getMiddleOfListWithPointers(head: Node?) -> Node? {
        var slowNode = head
        var fastNode = head
        while fastNode != nil && fastNode?.next != nil {
            slowNode = slowNode?.next
            fastNode = fastNode?.next?.next
        }
        return slowNode
    }


    func printList(head: Node?) {
        var current = head
        while current != nil {
            print(current?.value ?? -1)
            current = current?.next
        }
    }
    
    func removeDuplicateFromList(head: Node?) {
        var current = head
        var temp: Node?
        while current?.next != nil {
            if current?.value == current?.next?.value {
                temp = current?.next?.next
                current?.next = temp
            }
            current = current?.next
        }
    }
    
    func getNode(with position: Int) -> Node? {
        var counter = 1
        var current = head
        while current?.next != nil && counter <= position {
            if counter == position {
                return current
            }
            current = current?.next
            counter += 1
        }
        return current
    }
    
    func compareLikedList(head1: Node?, head2: Node?) -> Bool {
        var current1 = head1
        var current2 = head2
        while let n1 = current1, let n2 = current2 {
            if n1.value != n1.value {
                return false
            }
            current1 = n1.next
            current2 = n2.next
        }
        return current1 == nil && current2 == nil
    }
    
}



