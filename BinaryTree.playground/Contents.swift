import UIKit
import Foundation

// =========================== BINARY TREE PLAYGROUND ===========================
// =    * Binary Tree class                                                     =
// =    * Binary Tree constructor                                               =
// =    1. Insert Node                                                          =
// =    2. Search and return a boolean                                          =
// =    3. Search and return a tree                                             =
// =    4. Tree height                                                          =
// =    5. Tree depth                                                           =
// =    6. Minimun node                                                         =
// =    7. Maximun node                                                         =
// =    8. Delete all leaf                                                      =
// =    9. Delete a node                                                        =
// =    10. Inorder Traverse                                                    =
// =    11. Preorder Traverse                                                   =
// =    12. Postorder Traverse                                                  =
// =    13. Lever Order Traverse                                                =
// =    14. Array into a tree                                                   =
// =    15. Max depth of the tree                                               =
// =    16. Mirror the tree                                                     =
// ==============================================================================

/**
                     5                              H = 3, D = 0
                3                   7
            2               4     6             8           H = 0, D = 3
 
 */

// source: https://github.com/kodecocodes/swift-algorithm-club/blob/master/Binary%20Search%20Tree/Solution%201/BinarySearchTree.playground/Sources/BinarySearchTree.swift

var array = [2, 3, 4, 5, 6, 7, 8]

// Representing in memory
class BinaryTree {
    var parent: BinaryTree?
    var leftNode: BinaryTree?
    var rightNode: BinaryTree?
    var value: Int
    init(_ value: Int) {
        self.value = value
    }
}

extension BinaryTree {
    
    var isRoot: Bool {
        parent == nil
    }
    
    var hasLeaf: Bool {
        leftNode == nil && rightNode == nil
    }
    
    var isLeftChild: Bool {
        return parent?.leftNode === self
    }
    
    var isRightChild: Bool {
        parent?.rightNode === self
    }
    
    var hasLeftChild: Bool {
        leftNode != nil
    }
    
    var hasRightChild: Bool {
        rightNode != nil
    }
    
    var hasAnyChild: Bool {
        hasLeftChild || hasRightChild
    }
    
    var hasBothChildren: Bool {
        hasLeftChild && hasRightChild
    }
    
    var treeCount: Int {
        (leftNode?.treeCount ?? 0) + 1 + (rightNode?.treeCount ?? 0)
    }
    
    func insert(value: Int) {
        if value < self.value {
            if let left = leftNode {
                left.insert(value: value)
            } else {
                leftNode = BinaryTree(value)
                leftNode?.parent = self
            }
        } else {
            if let right = rightNode {
                right.insert(value: value)
            } else {
                rightNode = BinaryTree(value)
                rightNode?.parent = self
            }
        }
    }
    
    func remove() -> BinaryTree? {
        
        let replace: BinaryTree?
        
        if let left = leftNode {
            replace = left.minimum()
        } else if let right = rightNode {
            replace = right.maximun()
        } else {
            replace = nil
        }
        
        replace?.remove()
        
        replace?.rightNode = rightNode
        replace?.leftNode = leftNode
        rightNode?.parent = replace
        leftNode?.parent = replace
        reconnectParent(to: replace)
        return nil
    }
    
    func reconnectParent(to node: BinaryTree?) {
        if let parent = parent {
          if isLeftChild {
            parent.leftNode = node
          } else {
            parent.rightNode = node
          }
        }
        node?.parent = parent
      }
    
    func minimum() -> BinaryTree? {
        var node = self
        while let next = node.leftNode {
            node = next
        }
        return node
    }
    
    func maximun() -> BinaryTree? {
        var node = self
        while let next = node.rightNode {
            node = next
        }
        return node
    }
    
    func search(value: Int) -> BinaryTree? {
        if value == self.value {
            return self
        }
        if value < self.value {
            return leftNode?.search(value: value)
        } else {
            return rightNode?.search(value: value)
        }
    }
    
    func contains(value: Int) -> Bool {
        search(value: value) != nil
    }
    
    func depth() -> Int {
        var node = self
        var count = 0
        while let parent = node.parent {
            node = parent
            count += 1
        }
        return count
    }
    
    func height() -> Int {
        if hasLeaf {
            return 0
        }
        return 1 + max(leftNode?.height() ?? 0, rightNode?.height() ?? 0)
    }
    
    func maxDepth(root: BinaryTree?) -> Int {
        guard root != nil else { return 0 }
        let leftDepth = maxDepth(root: root?.leftNode)
        let rightDepth = maxDepth(root: root?.rightNode)
        
        if rightDepth < leftDepth {
            return leftDepth + 1
        } else {
            return rightDepth + 1
        }
    }
    
    // Mirror traverse each branch and swap the branches
    func mirrorTree(root: BinaryTree?) -> BinaryTree? {
        guard root != nil else  { return nil }
        mirrorTree(root: root?.leftNode)
        mirrorTree(root: root?.rightNode)
        
        let temp = root?.leftNode
        root?.leftNode = root?.rightNode
        root?.rightNode = temp
        
        return root
    }
}

extension BinaryTree {
    
    // Traversing binary tree usiong closures to visit node
    func traverseInOrder(visit: (Int) -> Void) {
        leftNode?.traverseInOrder(visit: visit)
        visit(value)
        rightNode?.traverseInOrder(visit: visit)
    }
    
    func traversePreOrder(visit: (Int) -> Void) {
        visit(value)
        leftNode?.traversePreOrder(visit: visit)
        rightNode?.traversePreOrder(visit: visit)
    }
    
    func traversePostOrder(visit: (Int) -> Void) {
        leftNode?.traversePostOrder(visit: visit)
        rightNode?.traversePostOrder(visit: visit)
        visit(value)
    }
    
    // Return array tree traversing
    func inOrderTraverse(node: BinaryTree?) -> [Int] {
        var tree = [Int]()
        guard let node = node else { return [] }
        inOrderTraverse(node: node.leftNode)
        tree.append(node.value)
        inOrderTraverse(node: node.rightNode)
        return tree
    }
    
    func preOrderTraverse(node: BinaryTree?) -> [Int] {
        var tree = [Int]()
        guard let node = node else { return [] }
        tree.append(node.value)
        preOrderTraverse(node: node.leftNode)
        preOrderTraverse(node: node.rightNode)
        return tree
    }
    
    func postOrderTraverse(node: BinaryTree?) -> [Int] {
        var tree = [Int]()
        guard let node = node else { return [] }
        postOrderTraverse(node: node.leftNode)
        postOrderTraverse(node: node.rightNode)
        tree.append(node.value)
        return tree
    }
}


// contruct a binary tree from array
func binaryTree(from arr: [Int], firtIndex: Int, lastIndex: Int) -> BinaryTree? {
    if lastIndex < firtIndex {
        return nil
    }
    let mid = (firtIndex + lastIndex) / 2
    let node = BinaryTree(arr[mid])
    node.leftNode = binaryTree(from: arr, firtIndex: firtIndex, lastIndex: mid - 1)
    node.rightNode = binaryTree(from: arr, firtIndex: mid + 1, lastIndex: lastIndex)
    return node
}
