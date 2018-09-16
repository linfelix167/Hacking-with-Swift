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

