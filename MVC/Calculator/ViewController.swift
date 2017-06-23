//
//  ViewController.swift
//  Calculator
//
//  Created by Nataliia Koldaeva on 6/19/17.
//  Copyright © 2017 Nataliia Koldaeva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var userIsInTheMiddleOfTyping: Bool = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let button = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + button
        } else {
            displayLabel.text = button
            userIsInTheMiddleOfTyping = true
        }
    }
    
    var displayValue: Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: Any) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = (sender as AnyObject).currentTitle {
            brain.performOperation(mathematicalSymbol!)
        }
        if let result = brain.result {
            displayValue = result
        }
    }
}

