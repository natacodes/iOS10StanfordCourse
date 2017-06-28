//: [Previous](@previous)

//: ## Optional
//: An optoonal is just an enum
enum Optional<T> {
    //The <T> ia a generic like as in Array<T>
    case none // not set
    case some(T) // set; "T" - associated value
}

let q: String? = nil
//: is let q = <String>.none
let w: String? = "hello"
//: is let w Optional<String>.some("hello")

//: Unwraping =
let e = r!
    Switch r {
    case .some(let value): y = value
    case .none: // raise an exception
}

if let t = y {
        // do something with y
}
// is
switch x {
    case .some(let y):
        //do somethong with y
    case .none:
        break
}

//: # Tuples
//: A group of values. You can use it anywhere you can a type.
let s: (String, Int, Double) = ("hello", 5, 0.85) // the type of "s" is "a tuple"
let (word, number, value) = s // this names the tuple elements
print(word)
print(number)
print(value)

//: Range
//: Is just two end points. A range can represent things like a selection in some text or a portion of an Array.

let array = ["a", "b", "c", "d"]
let a = array[2...3]
let b = array[2..<3]


//: ClosedCountableRange
for i in stride(from: 0.5, through: 15.25, by 0.3) {
    
}

//: # Data Structures in Swift
//: Classes, Structures and Enumerations
//: There are the 3 of the 4 fundamental buiding blocks of data structures in Swift

class ViewController: ... {
    
}
struct CalculatorBrain {
    
}
enum Op {
    
}







//: [Next](@next)
