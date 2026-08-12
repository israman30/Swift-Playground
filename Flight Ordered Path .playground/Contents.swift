import UIKit

/**

You are given an an array of 4 flights. Each flight array has a departing city (the first element in the array) and an arriving city (the second element in the array). You are to map out a trip in which you will visit each city one time.
 
You will start at a city and never return to it. When you arrive in a city you will then take off from that city for the next flight and never return to that city. The final destination will be a city in which there is no flight which departs from that city. You will use each flight exactly one time.
 
Create one function to compute the flight path of your trip and a second function to print the result in this format
 
"ATL -> CHI -> DC -> PHI -> MIA"
**/

let unorderedFlights: [[String]] = [
    ["ORL", "SF"],
    ["DAL", "LAX"],
    ["CLT", "ORL"],
    ["SF", "DAL"]
]

func computeFlights(flights: [[String]]) -> [String] {
    var routes = [String:String]() // Routes
    var destination = Set<String>() // Destinations
    
    // Build flight itinerary
    for flight in flights {
        let from = flight[0]
        let to = flight[1]
        routes[from] = to
        destination.insert(to)
    }
    
    var start = ""
    // track destinations without repeat
    for flight in flights {
        let from = flight[0]
        if !destination.contains(from) {
            start = from
        }
    }
    
    var path: [String] = [start]
    // Build flight path
    while let next = routes[start] {
        path.append(next)
        start = next
    }
    
    return path
}
// print -> ["CLT", "ORL", "SF", "DAL", "LAX"]
