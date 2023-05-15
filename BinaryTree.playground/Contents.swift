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

// Representing in memory
class Node {
    var leftNode: Node?
    var rightNode: Node?
    var value: Int
    init(_ value: Int) {
        self.value = value
    }
}

// contruct a binary tree from array
func binaryTreeFrom(arr: [Int], firtIndex: Int, lastIndex: Int) -> Node? {
    if lastIndex < firtIndex {
        return nil
    }
    let mid = (firtIndex + lastIndex) / 2
    let node = Node(arr[mid])
    node.leftNode = binaryTreeFrom(arr: arr, firtIndex: firtIndex, lastIndex: mid - 1)
    node.rightNode = binaryTreeFrom(arr: arr, firtIndex: mid + 1, lastIndex: lastIndex)
    return node
}
