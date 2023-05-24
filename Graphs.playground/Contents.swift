import UIKit

class Queue {
    var array = [Int]()
    func push(_ value: Int) {
        array.append(value)
    }
    func pop() -> Int {
        array.first!
    }
    var isEmpty: Bool {
        array.isEmpty ? true : false
    }
    var front: Int {
        array.first!
    }
    var last: Int {
        array.last!
    }
}

//void bfs(vector<int> graph[], int start)
//{
//    vector<bool> visited(V, false);
//    queue<int> q;
//    q.push(start);
//    visited[start] = true;
//    while (!q.empty()) {
//        int v = q.front();
//        cout << v << "  ";
//        q.pop();
//        // Enqueue all adjacent nodes of v and mark them visited
//        for (auto i = graph[v].begin(); i != graph[v].end(); i++) {
//            if (!visited[*i]) {
//                q.push(*i);
//                visited[*i] = true;
//            }
//        }
//    }
//}

func bfs(graph: [Int], start: Int) {
    var isVisited = false
    let queue = Queue()
    queue.push(start)
    isVisited = true
    while !queue.isEmpty {
        let vector = queue.front
        queue.pop()
        for i in graph {
            if isVisited {
                queue.push(graph[i])
                isVisited = true
            }
        }
    }
}
