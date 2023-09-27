//: [Previous](@previous)

import Foundation
import Combine


// Basic CombineLatest
let strPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()

Publishers.CombineLatest(strPublisher, numPublisher).sink { (str, num) in
    print("\(str) , \(num)")
}
//strPublisher.combineLatest(numPublisher).sink { (str, num) in
//    print("\(str) , \(num)")
//}

//strPublisher.send("a")
//strPublisher.send("b")
//strPublisher.send("c")
//
//numPublisher.send(1)
//numPublisher.send(2)
//numPublisher.send(3)

strPublisher.send("a")
numPublisher.send(1)
strPublisher.send("b")
strPublisher.send("c")


numPublisher.send(2)
numPublisher.send(3)



// Advanced CombineLatest
let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

Publishers.CombineLatest(usernamePublisher, passwordPublisher)
    .map { (username, password) -> String in
//        return !username.isEmpty && !password.isEmpty && password.count > 12
        return username+password
    }
    .sink { valid in
        print(valid)
    }

//let validatedCrendetialsSubscription = usernamePublisher.combineLatest(passwordPublisher)
//    .map { (username, password) -> String in
////        return !username.isEmpty && !password.isEmpty && password.count > 12
//        return username+password
//    }
//    .sink { valid in
//        print(valid)
//    }

usernamePublisher.send("WooShang")
passwordPublisher.send("weakPW")
passwordPublisher.send("veryLongAndStrongPW")



// Merge => 타입이 같아야함
let publisher1 = [1,2,3,4,5].publisher
let publisher2 = [300,400,500].publisher

Publishers.Merge(publisher2, publisher1)
    .sink { value in
        print("Merge : \(value)")
    }

//let mergePublisherSubscription = publisher1.merge(with: publisher2)
//    .sink { value in
//        print("Merge : \(value)")
//    }


//: [Next](@next)
