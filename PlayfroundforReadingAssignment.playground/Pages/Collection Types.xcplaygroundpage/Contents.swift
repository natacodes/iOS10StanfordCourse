//: [Previous](@previous)
//: # Collection Types
//: Swift provides three primary collection types, known as arrays, sets, and dictionaries.  
//: Arrays are ordered collections of values. Sets are unordered collections of unique values. Dictionaries are unordered collections of key-value associations.

//: ## Mutability of Collections
//: If you create an array, a set, or a dictionary, and assign it to a variable, the collection that is created will be mutable. This means that you can change (or mutate) the collection after it is created by adding, removing, or changing items in the collection.

//: ## Arrays
//: An array stores values of the same type in an ordered list. The same value can appear in an array multiple times at different positions.
var someInt = [Int]()
print("someInts is of type [Int] with \(someInt.count) items.")

//: ## Dictionaries
//: A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering. Each value is associated with a unique key, which acts as an identifier for that value within the dictionary.
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]


//: [Next](@next)
