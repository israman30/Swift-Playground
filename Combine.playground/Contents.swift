import UIKit
import Combine
import PlaygroundSupport

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

/*let newEventLabelSubscriber = Subscribers.Assign(object: theEventTitleLabel, keyPath: \.text)
eventPublisher.subscribe(newEventLabelSubscriber) */

eventPublisher.assign(to: \.text, on: theEventTitleLabel)
/**
 The assign(to:on) operator subscribes to the notification publisher and links to the lifetime of the label. Once the label gets released, its subscription gets released too.
 */

let event = Event(title: "Combine framework", scheduled: Date())
NotificationCenter.default.post(name: .addedEvent, object: event)

print("Event notified: \(theEventTitleLabel.text ?? "No event")")


// MARK: - Timer Subscription, reating a Subscription

let subscriptor = Timer.publish(every: 1, on: .main, in: .common)
    .autoconnect()
    .sink { output in
        print("Finish stream with: \(output)")
    } receiveValue: { value in
        print("Receive value: \(value)")
    }

/**
 Cancelling the Subscription
 Call cancel()
 */
RunLoop.main.schedule(after: .init(Date(timeIntervalSinceNow: 4))) {
    print(" - cancel subscription")
    subscriptor.cancel()
    /// or
//    subscriptor = nil
}

/*
 Timer.publish(): Returns a publisher that repeatedly emits the current date on the given interval.

 .autoconnect: Starts the timer when the Timer object is created.

 sink {}:

 output block: called when the subscription is finished.
 receiveValue block: called when any value is published
 */

