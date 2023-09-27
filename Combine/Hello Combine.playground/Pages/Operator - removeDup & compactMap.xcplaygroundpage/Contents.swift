//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// removeDuplicates
let words = "woo shang hyeon go go naver !"
    .components(separatedBy: " ")
    .publisher
words
    .removeDuplicates()
    .sink { value in
        print(value)
    }.store(in: &subscriptions)

// compactMap

let strings = ["a", "3.14", "11", "22", "woo", "4ws1"].publisher

strings
    .compactMap { Float($0)}
    .sink { value in
        print(value)
    }.store(in: &subscriptions)


// ignoreOutput

let numbers = (1...10_000).publisher

numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) } )
    .store(in: &subscriptions)


// prefix
let tens = (1...10).publisher

tens
    .prefix(2)
    .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) } )
    .store(in: &subscriptions)


//: [Next](@next)
