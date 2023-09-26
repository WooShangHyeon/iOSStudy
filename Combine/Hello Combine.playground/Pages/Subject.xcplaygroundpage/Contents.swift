import Foundation
import Combine

// PassthroughSubject
let relay = PassthroughSubject<String, Never>()
let subscription1 = relay.sink { value in
    print("subscription1 : \(value)")
}
//
//relay.send("Hello")
//relay.send("world!")



// CurrentValueSubject

let variable = CurrentValueSubject<String, Never>("initial")
let subscription2 = variable.sink { value in
    print("subscription2 : \(value)")
}

//variable.send("\(variable.value) + second value")

let publisher = ["woo","sang","hyeon"].publisher
publisher.subscribe(relay)
publisher.subscribe(variable)
