//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Nataliia Koldaeva on 6/21/17.
//  Copyright © 2017 Nataliia Koldaeva. All rights reserved.
//
// This file is Model in MVC Design Pattern.

import Foundation

func changeSign(operand: Double) -> Double {
    return -operand
}

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    // Enum
    private enum Operation {
        case constant(Double)
        // Functions as types
        case unaryOperation((Double) -> Double)
    }
    
    // Dictionary<keyType, ValueType>
    private var operations: Dictionary<String,Operation> = [
            // Associated values
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos),
        "+/-" : Operation.unaryOperation(changeSign)
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
            }
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
