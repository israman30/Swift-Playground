import UIKit

class TimeString {
    // MARK: - setDate function returns a Date of type String that is assigned to the date object created by the context
    static func setDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: Date())
    }
}
