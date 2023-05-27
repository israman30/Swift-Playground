import UIKit

// concurrency: I's the process by which a computer or individual program can perform multiple tasks simultaneously, including executing tasks or processes in the background

//let queue = DispatchQueue(label: "number concurrent")
let queue = DispatchQueue(label: "number concurrent", attributes: .concurrent)

var result: [Int] = []
// 1.- print first
for i in 0...5 {
    result.append(i)
}
print(result)

// 2.- print - concurrent is impredicatable
queue.async {
    var result: [Int] = []
    for i in 10...15 {
        result.append(i)
    }
    print("async A:" ,result)
}
// 3.- print - concurrent is impredicatable
queue.async {
    var result: [Int] = []
    for i in 20...25 {
        result.append(i)
    }
    print("async B:" ,result)
}

// It's been print in any order - concurrent is impredicatable
result = []
for i in 10...15 {
    result.append(i)
}
print(result)
