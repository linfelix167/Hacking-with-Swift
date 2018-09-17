import UIKit

/* Create multi-dimensional arrays */

// This is our array of arrays
var groups = [[String]]()

// Create three simple string arrays for testing
var groupA = ["England", "Irland", "Scotland", "Wales"]
var groupB = ["Canada", "Mexico", "United States"]
var groupC = ["Chona", "Japan", "South Korea"]

// Add them all to the groups array
groups.append(groupA)
groups.append(groupB)
groups.append(groupC)

// This will print out the array of arrays
print("The groups are:", groups)

// Now append an item to one of the arrays
groups[1].append("Costa Rica")
print("\nAfter adding Costa Rica, the groups are:", groups)

// Now print out groupB's contents again
print("\nGroup B still contains:", groupB)

/* Count objects in a set using NSCountedSet */

let set = NSCountedSet()
set.add("Bob")
set.add("Charlotte")
set.add("John")
set.add("Bob")
set.add("James")
set.add("Sophie")
set.add("Bob")
print(set.count(for: "Bob"))

/* Enumerate items in an array */

let array = ["Apples", "Peaches", "Plums"]

for (index, item) in array.enumerated() {
    print("Found \(item) at position \(index)")
}

/* Find an item in an array using index(of:) */
if let index = array.index(of: "Peaches") {
    print("Found peaches at index \(index)")
}

/* Join an array of strings into a single string */
let joined = array.joined(separator: ", ")

/* Loop through an array in reverse */
for item in array.reversed() {
    print("Found \(item)")
}

for (index, item) in array.reversed().enumerated() {
    print("Found \(item) at position \(index)")
}

/* Loop through items in an array */
for item in array {
    print("Found \(item)")
}

/* Shuffle an array in iOS 8 and below */
extension Array {
    mutating func shuffle() {
        for i in 0 ..< (count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swapAt(i, j)
        }
    }
}
