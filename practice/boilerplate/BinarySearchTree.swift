import Foundation

public class BinarySearchTree <T: Comparable> {
    public var value: T
    public var left: BinarySearchTree<T>?
    public var right: BinarySearchTree<T>?

    public init(value: T) {
        self.value = value
    }

    public func insert(value: T) {
        if value < self.value {
            if let left = self.left {
                left.insert(value)
            }
            else {
                left = BinarySearchTree<T>(value: value)
            }
        }
        if (value > self.value) {
            if let right = self.right {
                right.insert(value)
            }
            else {
                right = BinarySearchTree<T>(value: value)
            }
        }
    }

    /// Prints the values in level order
    public var levelOrderValues : [T] {
        var values = [T]()
        var nodes = [BinarySearchTree<T>]()
        nodes.append(self)

        while !nodes.isEmpty {
            let node = nodes.removeLast()
            values.append(node.value)
            if let l = node.left {
                nodes.insertFirst(l)
            }
            if let r = node.right {
                nodes.insertFirst(r)
            }
        }
        return values
    }
}
