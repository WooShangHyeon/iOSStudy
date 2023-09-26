//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber
let just = Just(1000) //Just => 퍼블리셔
let subscription1 = just.sink { value in
    print("value : \(value)")
}

let arrayPublisher = [1,2,3,4,5].publisher
let subscription2 = arrayPublisher.sink { value in
    print("value : \(value)")
}

class MyClass {
    var property: Int = 0 {
        didSet {
            print("property: \(property)")
        }
    }
}

let object = MyClass()
let subscription3 = arrayPublisher.assign(to: \.property, on: object)
print("object final value : \(object.property)")





//: [Next](@next)


