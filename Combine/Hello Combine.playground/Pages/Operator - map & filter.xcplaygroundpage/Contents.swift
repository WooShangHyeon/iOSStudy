//: [Previous](@previous)

import Foundation
import Combine

// Transform - Map
let numPublisher = PassthroughSubject<Int,Never>()
let subscriotin = numPublisher
    .map { $0 * 2}
    .sink { value in
        print(value)
    }
numPublisher.send(10)

    

// Filter
let stringPublisher = PassthroughSubject<String, Never>()
let subscription2 = stringPublisher
    .filter { $0.contains("a") }
    .sink { value in
        print(value)
    }

stringPublisher.send("abc")
stringPublisher.send("bbb")
stringPublisher.send("woo")
stringPublisher.send("bbba")
subscription2.cancel()

//: [Next](@next)
