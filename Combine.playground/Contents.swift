import UIKit
import Combine

/*
 ombine was introduced as a new framework by Apple at WWDC-2019. It provides a declarative Swift API for processing values over time.
 
 Publishers and Subscribers
 A Publisher exposes values (that can change) on which a subscriber subscribes to receive all those updates. If you relate them to RxSwift:

 Publishers are like Observables
 Subscribers are like Observers
 A Combine publisher is an object that sends values to its subscribers over time. Sometimes this is a single value, and other times a publisher can transmit multiple values or no values at all.
 */

["🍔", "🌭", "🍰"]
    .publisher
    .sink {
        switch $0 {
        case .failure(let error):
            print("Something went wrong: \(error.localizedDescription)")
        case .finished:
            print("Finished")
        }
    } receiveValue: { value in
        print("Received value: \(value)")
    }

/*
 NotificationCenter.Publisher
 Let’s create a new publisher for a new-event notification.
 */

extension Notification.Name {
    static let addedEvent = Notification.Name("added_event")
}

struct Event {
    let title: String
    let scheduled: Date
}

let eventPublisher = NotificationCenter.Publisher(center: .default, name: .addedEvent)
    .map { notification -> String? in
        return (notification.object as? Event)?.title ?? ""
    }

let theEventTitleLabel = UILabel()

let newEventLabelSubscriber = Subscribers.Assign(object: theEventTitleLabel, keyPath: \.text)
eventPublisher.subscribe(newEventLabelSubscriber)

let event = Event(title: "Combine framework", scheduled: Date())
NotificationCenter.default.post(name: .addedEvent, object: event)

print("Event notified: \(theEventTitleLabel.text ?? "No event")")
