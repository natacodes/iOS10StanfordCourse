# iOS10StanfordCourse
[Developing iOS 10 Apps with Swift by Stanford](https://itunes.apple.com/us/course/developing-ios-10-apps-with-swift/id1198467120)

# Lecture 1. Introduction

Start working with Xcode. Short view on interface in Xcode. First steps of creating application.

**import** - it's basically saying "I want to use this framework ...". This is UI behavior controlling code. It needs to use UIKit.

    import UIKit
    class ViewController: UIViewController {

**class ViewController: UIViewController** is first decalaration. Keyword **class**, "ViewController" is *name*. This Colon "**:**" and *UIViewController* is the class that view controller inherits from. This is object oriented programming, this is inheritance.

func touchDigit(_ sender: UIButton) -> String
    
If function needs something to return, we need to use **->** and type returning value.  
**(_ sender: UIButton)** - Underbar means there is no external.  
**_ sender: UI Button** - Internal name, name that we will use inside the function.
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var userIsInTheMiddleOfTyping: Bool = false
    
**UILabel** - implicitly unwrapped optional.
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + digit
        } else {
            displayLabel.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }

**sender** is argument.

**sender.** - the object and dot to send the message. You will have all properties and metods that button can do.

**{ get }** in description means that you can only get the curent title. Click to Property Reference to read more.

**String?** - totally different type from String. It's called an optional. A type optional has only two values, "set" and "not set". When it "set" case, it can have an associated value. A value that it kinda keeps on the side and you specify when you create the optional or you declare it what type that associated value is. So this, the associated value is a string. The type of this digit is optional strenght. Which means an optional who's associative value in the set state is a string. In this case we want the associated value here. Exclamation point - give us that value. If we put the explanation point at the end of an optional then it will, if it's in the set state, grab the associated value and give it to you.
Swift unwraped the optional with **"!"** and you got string in var value.

    var displayValue: Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
Swift all properties have to be initialized.
Initializer is a special method, it's called **init**.
    
    @IBAction func performOperation(_ sender: Any) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = (sender as AnyObject).currentTitle! {
            switch mathematicalSymbol {
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
    }
}

If I can unwrap this optional, get its associated value, then I'll do something, and inside it will be unwrapped optional.

**Cntl** + **I** = it will re-indent everything for you.

# Lecture 2. MVC
**MVC** - Model, Controller, View. Object-Oriented Design Pattern.  
We devide up all of the code in app into three different camps.  

**Model** - what your application is (but not how it is displayed).  
**Controller** - how your *Model* is presented to the use (UI logic). The controller decides how to take this UI independent thing, the model, and display it on your screen and interact with the user.  
**View** - the minions of the controller. Things that the controller uses to do its job, almost always, these things in the view are generic, things like UIButton or UIScrollView.

The key to makeing MVC work is managing the communication beetweem this camps.  
Contrillers can always talk directly to their Model. It can say anything to the model that the Model publicly allows to be said to itself. And no restriction of the controller talking to the view, because the view are the controllers meanions.  This connections between the controller and  a view, we call them ***outlets***.

The **Model** and **View** should never speak to aech other.  

Can the **View** speak to **Controller**? Sort of. Communication is "blind" and structured. The **Controller** can drop a ***target*** on itself. Then hand out an ***action*** to the **View**. The **View** sends the **action** when things happen in the UI. Sometimes the **View** needs to synchronize with the **Controller**. The **Controller** sets itself as the **View**'s delegate. The **delegate** is set via a protocol (i.e. it's "blind" to class). **Views do not own the data they display.** If needed, they have a protocol to acquire it. **Controller**s are almost always that data source (not **Model**). Controllers interpret/format **Model** information for the **View**.

Can the **Model** talk directly to the **Controller**? No. The **Model** is (should be) UI independent. If the **Model** has information to update or something it usee a "radio station" - like broadcast mechanism. **Controller**s (or other **Model**) "tune in" to interesting stuff. A **View** might "tune in", but probably not to a **Model**'s "station".

## Struct vs. Class (mutating, etc.)
Two most important differences:
1. Classes have inheritance, structs do not.
2. Classes live in the heap, and you have pointers to them. Structs do not line in the heap, and they are passed around by copying them.
struct CalculatorBrain {
// The struct automatically get initialiser that will initialize all of their uninitialized vars.
## Public versus *private* API
    private var accumulator: Double?
    
    func performOperation(_ symbol: String) {
        
    }
    mutating func setOperand(_ operand: Double) {
**Mutating** = this metod can change the value of this struct.
        accumulator = operand
        
    }
}
## More examples of Optional
    // Read-only property
    var result: Double? {
        get {
            return accumulator
        }
    }
## Dictionary<keyType, ValueType>
    private var operations: Dictionary<String,Operation> = [
        // associated values
        "π" : Double.pi,
        "e" : M_E
    ]
## Enum
    private enum Operation {
        case constant
        case unaryOperation
    }
## Associated values
    private enum Operation2 {
        case constant(Double)
        case unaryOperation((Double) -> Double)
    }

    private var operations2: Dictionary<String,Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation, //sqrt,
        "cos" : Operation.unaryOperation
    ]

    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
## Switch
            switch operation {
            case .constant(let associatedConstantValue):
                accumulator = associatedConstantValue
            case .unaryOperation:
                break
            }
        }
    }
## Functions as types
    // Enum
    private enum Operation {
        case constant(Double)
        // Functions as types
        case unaryOperation((Double) -> Double)
    }
## Closure syntax for defining functions "on the fly"
    func changeSign(operand: Double) -> Double {
        return -operand
    }
    let i = 27
    var f: (Double) -> Double
    f = changeSign
    let x = f(81)

## UIStackView
## First peek at Autolayout (stick things to the edges)
