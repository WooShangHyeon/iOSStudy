//: [Previous](@previous)

import Foundation
import Combine

let subject = PassthroughSubject<String, Never>()

// The print() operator prints you all lifecycle events
let subscription1 = subject
    .print("[Debug]")
    .sink { value in
    print("subscriotion value : \(value)")
}

subject.send("first")
subject.send("second")
subject.send("third")
//subject.send(completion: .finished)
subscription1.cancel()
subject.send("final")




//: [Next](@next)
