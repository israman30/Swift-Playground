import UIKit

var array = [Int]()
for i in 1...50 {
    array.append(i)
}

func fib(num: Int) {
    var first = 0
    var second = 1
    var holder = 0
    for _ in 0...num {
        holder = first
        first = second
        second = holder + second
        print(holder)
    }
}

func fibRecursive(num: Int) -> Int {
    if num == 0 {
        return 0
    } else if num == 1 {
        return 1
    }
    return fibRecursive(num: num - 1) + fibRecursive(num: num - 2)
}
fib(num: 10)

for j in 0...10 {
    print(fibRecursive(num: j))
}

func fibT(num: Int) {
    var (first, second, holder) = (0, 1, 0)
    for _ in 0...num {
        holder = first
        first = second
        second = holder + second
        print(holder)
    }
}
fibT(num: 10)

