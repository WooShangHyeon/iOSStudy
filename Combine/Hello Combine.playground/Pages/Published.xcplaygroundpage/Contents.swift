//: [Previous](@previous)

import Foundation
import UIKit
import Combine

final class SomeViewModel {
    @Published var name: String = "woo"
    var age: Int = 25
}

final class Label {
    var text: String = "hello"
}

let label = Label()
let vm = SomeViewModel()

print("label text : \(label.text)")
vm.$name.assign(to: \.text, on: label)
print("label text : \(label.text)")
vm.name = "you"
print("label text : \(label.text)")

//: [Next](@next)
