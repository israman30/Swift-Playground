import UIKit

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
