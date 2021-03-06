//
//  ViewController.swift
//  MVC.Calculator
//
//  Created by Roman Bakhilov on 30.07.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    let decimalChar = "."
    var stillTyping = false
    var operation = Calculation()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var displayValue: Double {
        get {
            return NumberFormatter().number(from: displayLabel.text!)!.doubleValue
        }
        set{
            displayLabel.text = "\(newValue)"
            stillTyping = false
        }
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        
        if stillTyping {
            if number != decimalChar || (displayLabel.text?.characters.count)! < 15 {
                displayLabel.text = displayLabel.text! + number
            }
        } else {
            if number == decimalChar {
                displayLabel.text = "0\(number)"
            } else {
                displayLabel.text = number
            }
        }
        stillTyping = true
    }
    
    @IBAction func onTouchOpertion(_ sender: UIButton) {
        
        if stillTyping {
            operation.setOperand(operand: displayValue)
            stillTyping = false
        }
        
        if let mathSymbol = sender.currentTitle {
            operation.performOperation(symbol: mathSymbol)
        }
        displayValue = operation.result
    }
    
}




