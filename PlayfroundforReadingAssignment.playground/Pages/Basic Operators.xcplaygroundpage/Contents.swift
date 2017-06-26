//: [Previous](@previous)
//: # Basic Operations

//: ## Terminology
//: ***Unary*** operators operate on a single target (such as -a). Unary prefix operators appear immediately before their target (such as !b), and unary postfix operators appear immediately after their target (such as c!).  
//: ***Binary*** operators operate on two targets (such as 2 + 3) and are infix because they appear in between their two targets.  
//: ***Ternary*** operators operate on three targets. Like C, Swift has only one ternary operator, the ternary conditional operator (a ? b : c).  

//: ### Assignment Operator
//: The assignment operator (a = b) initializes or updates the value of a with the value of b:
let b = 10
var a = 5
a = b
// a is now equal to 10

//: ### Arithmetic Operators
/*:
- Addition (+)
- Subtraction (-)
- Multiplication (*)
- Division (/)
 */

//: ### Remainder Operator
//: The remainder operator (a % b) works out how many multiples of b will fit inside a and returns the value that is left over (known as the remainder).
var remainderOperator = 9 % 4
remainderOperator
//: To determine the answer for a % b, the % operator calculates the following equation and returns remainder as its output:  
//: var a = (b * some multiplier) + remainder  
//: where some multiplier is the largest number of multiples of b that will fit inside a. Inserting 9 and 4 into this equation yields:  
//: 9 = (4 x 2) + 1  

//: ### Compound Assignment Operators
//: Swift provides compound assignment operators that combine assignment (=) with another operation. One example is the addition assignment operator (+=):
var c = 4
c += 2

//: ### Comparison Operators
/*:
- Equal to (a == b)
- Not equal to (a != b)
- Greater than (a > b)
- Less than (a < b)
- Greater than or equal to (a >= b)
- Less than or equal to (a <= b)
 */
1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 is not equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 is not less than or equal to 1
//: Comparison operators are often used in conditional statements, such as the if statement.
//: ### Ternary Conditional Operator
if question {
    answer1
} else {
    answer2
}

//: ### Nil-Coalescing Operator
//: The nil-coalescing operator (a ?? b) unwraps an optional a if it contains a value, or returns a default value b if a is nil. The expression a is always of an optional type. The expression b must match the type that is stored inside a.  
//: The nil-coalescing operator is shorthand for the code below:
a != nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"

//: ### Range Operators
//: Swift includes several range operators, which are shortcuts for expressing a range of values.
//: ### Closed Range Operator
//: The closed range operator (a...b) defines a range that runs from a to b, and includes the values a and b. The value of a must not be greater than b.
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//: ### Half-Open Range Operator
//: The half-open range operator (a..<b) defines a range that runs from a to b, but does not include b.
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

//: ### One-Sided Ranges
//: The operator has a value on only one side.
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

//: ### Logical Operators
//: Logical operators modify or combine the Boolean logic values true and false. Swift supports the three standard logical operators found in C-based languages:
/*:
- **Logical NOT (!a)** -  inverts a Boolean value so that true becomes false, and false becomes true.
- **Logical AND (a && b)** - creates logical expressions where both values must be true for the overall expression to also be true.
- **Logical OR (a || b)** - use it to create logical expressions in which only one of the two values has to be true for the overall expression to be true.
 */

//: [Next](@next)
