//
//  ViewController.swift
//  Calculator
//
//  Created by Narayan Balasubramanian on 8/2/16.
//  Copyright © 2016 SJSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    var currentlyTyping = false
    
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if (currentlyTyping) {
            display.text! = display.text! + digit
        } else {
            display.text! = digit
        }
        currentlyTyping = true;
    }
    
    private var displayValue : Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorModel()
    
    @IBAction private func performOperation(sender: UIButton) {
        if currentlyTyping {
            calculator.setOperand(displayValue)
            currentlyTyping = false
        }
        if let mathSymbol = sender.currentTitle {
            
            calculator.performOperation(mathSymbol)
        }
        displayValue = calculator.result
        
    }
}

