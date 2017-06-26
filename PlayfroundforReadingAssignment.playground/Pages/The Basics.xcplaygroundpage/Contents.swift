//: # The Basics

//: ## Constants and Variables
//: The value of a constant cannot be changed once it is set, whereas a variable can be set to a different value in the future.  
//: **Declaring Constant:**
let maximumNumberOfLoginAttempts = 10
//: **Declaring Variable:**
var currentLoginAttempt = 0
//: *“Declare a new constant called maximumNumberOfLoginAttempts, and give it a value of 10. Then, declare a new variable called currentLoginAttempt, and give it an initial value of 0.”*

//: ## Integers
//: Integers are whole numbers with no fractional component. Swift provides signed and unsigned integers in 8, 16, 32, and 64 bit forms.

//: ## Floating-Point Numbers
//: Floating-poin numbers are numbers with fractional component, such as 3.14159, 0.1, and -273.15.  
//: Swift provides two signed floating-point number types:
/*: 
- *Double* represents a 64-bit floating-point number.
- *Float* represents a 32-bit floating-point number.
 */

//: ## Type Safety and Type Inference
//: A type safe language encourages you to be clear about the types of values your code can work with. Because Swift is type safe, it performs type checks when compiling your code and flags any mismatched types as errors. If you don’t specify the type of value you need, Swift uses type inference to work out the appropriate type. Type inference is particularly useful when you declare a constant or variable with an initial value.
var numbersWithNoFractionalComponent:Double = 3
let doubleExample = 0.65
let integerPlusDouble = numbersWithNoFractionalComponent + doubleExample

//: ## Booleans
//: Boolean values are referred to as logical, because they can only ever be true or false.
let orangesAreOrange = true
let turnipsAreDelicious = false

//: ## Tuples
//: Tuples group multiple values into a single compound value. The values within a tuple can be of any type and do not have to be of the same type as each other.
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")

//: ## Optionals
//: You use optionals in situations where a value may be absent. An optional represents two possibilities: Either there is a value, and you can unwrap the optional to access that value, or there isn’t a value at all.
//: ### If Statements and Forced Unwrapping
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
//: Once you’re sure that the optional does contain a value, you can access its underlying value by adding an exclamation mark (!) to the end of the optional’s name.
//if convertedNumber != nil {
//    print("convertedNumber has an integer value of \(convertedNumber!).")
//}
//: ### Implicitly Unwrapped Optionals
//: You write an implicitly unwrapped optional by placing an exclamation mark (String!) rather than a question mark (String?) after the type that you want to make optional.
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark

//: ## Error Handling
//: You use error handling to respond to error conditions your program may encounter during execution.


//: [Next](@next)
