import UIKit
import UserNotifications

extension UIViewController {
    
    func notifications(for date: Date){
        // 1. Ask for permission
        let center = UNUserNotificationCenter.current()
        // Add more options
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            // If user no give permissions, let it know go to user settings
            if let error = error {
                print("Error", error)
                return
            }
        }

        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.subtitle = "subtitle"
        content.body = "body"
        
        // 3. Create a trigger
        // Customize the date selected in your app picking a component
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        // 4. Create a request
        
        let request = UNNotificationRequest(identifier: "IDENTIFIER", content: content, trigger: trigger)
        center.removeAllPendingNotificationRequests()
        
        // 5. Register the request
        center.add(request) { (error) in
            // check error
            if let error = error { print("Error getting a badge",error) }
            
        }
    }
}
