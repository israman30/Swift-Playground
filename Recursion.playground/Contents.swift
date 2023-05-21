import UIKit


/**
    sum(5)                  sum(4)              sum(3)                  sum(2)                 sum(1)
    5 + sum(4)          4 + sum(3)          3 + sum(2)          2 + sum(1)          1 + sum(0)
    5 + 10                 4 + 6                   3 + 3                   2 + 1                    1 + 0
    15                       10                       6                         3                           1
 
 */

func sum(n: Int) -> Int {
    if n == 0 {
        return 0
    }
    return n + sum(n: n - 1)
}
sum(n: 4)

/*
 Write a function that takes two inputs n and m and outputs the number of unique
 paths from the top left corner to bottom right corner of a n x m grid.
 Constrains: you can only move dwon or right 1 unit at a time.
 
            gridPaths(2, 4) -> 4
 []            [][]         [][][]          [][][][]
 [][][][]      [][][]           [][]              []
 
            gridPaths(3,3) -> 6
 []         []          []          [][]        [][]        [][][]
 []         [][]        [][][]        []          [][]          []
 [][][]       [][]          []        [][]          []          []
 */
func gridPaths(_ n: Int, _ m: Int) -> Int {
    if n == 1 || m == 1 {
        return 1
    }
    return gridPaths(n, m - 1) + gridPaths(n - 1, m)
}
gridPaths(2, 3)
