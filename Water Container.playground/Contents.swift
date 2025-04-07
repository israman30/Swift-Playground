import UIKit

/// Find two lines that together with the x-axis form a container, such that the container contains the most water.
/// Return the maximum amount of water a container can store.
/// 
func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var maxArea = 0
    
    while left < right {
        let width = right - left
        let currentHeight = min(height[left], height[right])
        let currentArea = width * currentHeight
        maxArea = max(maxArea, currentArea)
        
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return maxArea
}
