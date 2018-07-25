//
//  ViewController.swift
//  Calculator
//
//  Created by py on 2018/7/25.
//  Copyright © 2018年 cn.py. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstOperand = 0.0
    var secondOperand = 0.0
    var isDecimal = false
    var oprd = ""
    var isSecond = false
    //After a caculation, clear the screen
    var nextCalculate = false
    @IBOutlet weak var resultLabel: UILabel!
    

    @IBAction func buttonTap(_ sender: UIButton) {
        if resultLabel.text == "0" || (isSecond && secondOperand == 0.0 || nextCalculate){
                resultLabel.text = ""
        }
        // the number occur in label
        resultLabel.text = resultLabel.text! + sender.titleLabel!.text!
        
        if isSecond{
            secondOperand = (resultLabel.text! as NSString).doubleValue
        }else{
            firstOperand = (resultLabel.text! as NSString).doubleValue
        }
        // print(firstOperand)
        
    }
    
    @IBAction func DecimalPointTap() {
        if !isDecimal{
            resultLabel.text = resultLabel.text! + "."
            if isSecond{
                secondOperand = NSString(string: resultLabel.text!).doubleValue
            }else{
                firstOperand = NSString(string: resultLabel.text!).doubleValue
            }
            isDecimal = !isDecimal
        }
    
    }
    
    
    @IBAction func OperatorTap(_ sender: UIButton) {
        if firstOperand != 0{
            isSecond = true
            isDecimal = false
            
            let text = sender.titleLabel!.text!
            if text == "+" || text == "-" || text == "*" || text == "÷"{
                oprd = text
                
            }else{
                oprd = ""
            }
            resultLabel.text = oprd
        }
    }
    
    @IBAction func resultTap() {
        if isSecond{
            if oprd == "÷" && secondOperand == 0{
                print("Divisor can't be 0...")
                return
            }
            var result: Double = 0.0
            switch oprd {
            case "+":
                result = firstOperand + secondOperand
            case "-":
                result = firstOperand - secondOperand
            case "*":
                result = firstOperand * secondOperand
            case "÷":
                result = firstOperand / secondOperand
            default:
                result = 0.0
            }
            resultLabel.text = result.description
            nextCalculate = true
            print("First operand: \(  firstOperand)")
            print("Second operand:  \(secondOperand)")
            print("Operator: \(oprd)")
            print("result: \(result)")
            firstOperand = result
        }
    }
    
    @IBAction func clear() {
        resultLabel.text = "0"
        firstOperand = 0.0
        secondOperand = 0.0
        isDecimal = false
        isSecond = false
        oprd = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

