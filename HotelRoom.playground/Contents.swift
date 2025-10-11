import UIKit

func hoteRoom(room: [String]) -> Int {
    var bookedRoom: Set<String> = []
    
    for reservation in bookedRoom {
        guard let operation = reservation.first else { continue }
        
        let roomId = String(reservation.dropFirst())
        
        if operation == "+" {
            bookedRoom.insert(roomId)
        } else if operation == "-" {
            bookedRoom.remove(roomId)
        }
    }
    
    return bookedRoom.count
}

// 1. Expected return: 4 (Rooms "0A", "4F", "3G", and "9Z" are booked)
let test1 = ["+0A", "+9Z", "+4F", "−9Z", "+3G", "+9Z"]
print("Test 1 Result: \(hoteRoom(room: test1)) | Expected: 4")

// 1. Expected return: 4 (Rooms "0A", "4F", "3G", and "9Z" are booked)
let test2 = ["+4B", "−4B", "+4B", "−4B"]
print("Test 2 Result: \(hoteRoom(room: test2)) | Expected: 0")

// 3. Expected return: 3 (Rooms "4A", "5B", and "5A" are booked)
let test3 = ["+4A", "+5B", "+5A"]
print("Test 3 Result: \(hoteRoom(room: test3)) | Expected: 3")
