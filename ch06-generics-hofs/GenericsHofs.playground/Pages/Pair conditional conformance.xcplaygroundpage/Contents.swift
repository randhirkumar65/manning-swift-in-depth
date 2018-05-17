//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import UIKit

//: # Pair type with conditional conformance

struct Pair<T: Hashable, U: Hashable>: Hashable {
    let left: T
    let right: U
    
    init(_ left: T, _ right: U) {
        self.left = left
        self.right = right
    }
    
}

let set: Set = [
    Pair("Laurel", "Hardy"),
    Pair("Harry", "Lloyd")
]

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
