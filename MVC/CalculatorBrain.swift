//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Nataliia Koldaeva on 6/21/17.
//  Copyright © 2017 Nataliia Koldaeva. All rights reserved.
//
// This file is Model in MVC Design Pattern.

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    // Enum
    private enum Operation {
        case constant(Double)
        // Functions as types
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    // Dictionary<keyType, ValueType>
    private var operations: Dictionary<String,Operation> = [
            // Associated values
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos),
            // Closeres is a functions embedded rigth in line of code
        "+/-" : Operation.unaryOperation({ -$0 }),
        "*" : Operation.binaryOperation({ $0 * $1 }),
        "÷" : Operation.binaryOperation({ $0 / $1 }),
        "+" : Operation.binaryOperation({ $0 + $1 }),
        "-" : Operation.binaryOperation({ $0 - $1 }),
        "=" : Operation.equals
    ]
    
    // Mutating - this metod can change the value of this struct.
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            // Switch
            switch operation {
            case .constant(let associatedConstantValue):
                accumulator = associatedConstantValue
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals:
                print("TEST case .equals performPendingBinaryOperation()")
                performPendingBinaryOperation()
            }
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        print("TEST performPendingBinaryOperation")
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: (Double,Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
        
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
}
