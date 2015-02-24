import UIKit
import XCTest

public struct Node<T: Equatable> {
    let value: T
    let children : [Node<T>]

    public init(value: T) {
        self.value = value
        self.children = []
    }
}

public class Fn<T> {
    let fn : (random: Int, size: UInt) -> T
    public init(_ generator: (random: Int, size: UInt) -> T) {
        fn = generator
    }
}

public func nodeFactory() -> Fn<Node<Int>> {
    return Fn({ rnd, s in Node(value: 1) })
}

class GenericDeadlockExampleTests: XCTestCase {
    func testExample() {
        nodeFactory()
    }
}
