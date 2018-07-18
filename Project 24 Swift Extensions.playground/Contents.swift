import UIKit

var myInt = 0

extension Int {
  mutating func plusOne() {
    self += 1
  }
  
  func squared() -> Int {
    return self * self
  }
}

extension BinaryInteger {
  func squared() -> Self {
    return self * self
  }
}

myInt.plusOne()
myInt

let i: Int = 8
print(i.squared())
