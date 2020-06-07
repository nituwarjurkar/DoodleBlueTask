//
//  ViewController.swift
//  DoodleBlueTask
//
//  Created by Nitu Warjurkar on 06/06/20.
//  Copyright © 2020 Nitu Warjurkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let m_onesPositionStringArray = ["", "one ", "two ", "three ", "four ",
                                     "five ", "six ", "seven ", "eight ",
                                     "nine ", "ten ", "eleven ", "twelve ",
                                     "thirteen ", "fourteen ", "fifteen ",
                                     "sixteen ", "seventeen ", "eighteen ",
                                     "nineteen " ]
    
    // strings at index 0 and 1 are not used, they are to make array indexing simple
    let m_tensPositionStringArray = [ "", "", "twenty ", "thirty ", "forty ",
                                      "fifty ", "sixty ", "seventy ", "eighty ",
                                      "ninety " ]
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var wordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("\(convertNumberToWord(number: 124))")
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        wordLabel.layer.borderColor = UIColor.gray.cgColor
        wordLabel.layer.borderWidth = 1.0
        
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func convertClicked(_ sender: Any) {
        if numberTextField.text?.count ?? 0 < 10 {
            let numberToConvert = Int(numberTextField.text ?? "0")
            wordLabel.text = convertNumberToWord(number: numberToConvert ?? 0)
        } else {
            wordLabel.text = "Cannnot convert word greater than 99 crores"
        }
        
    }
    func getWordForNumber(number: Int) -> String {
        var numberString = ""
        if number > 19 {
            numberString = "\(m_tensPositionStringArray[number/10])\(m_onesPositionStringArray[number%10])"
        } else {
            numberString = m_onesPositionStringArray[number]
        }
        
        return numberString
    }
    func convertNumberToWord(number : Int) -> String {
        
        
        var numberOutputString = ""
        if number >= 10000000 {
            let numString = getWordForNumber(number: number / 10000000)
            //            numberOutputString.append("\(getWordForNumber(number: number / 10000000))crore ")
            if numString != "" {
                numberOutputString.append("\(numString)crore ")
            }
            //            if number % 100 == 0 {
            //                return numberOutputString
            //            }
            
        }
        if (number >= 100000) {
            
            let numString = getWordForNumber(number: number/100000 % 100)
            if numString != "" {
                numberOutputString.append("\(numString)lakh ")
            }
            
        }
        if (number >= 1000) {
            let numString = getWordForNumber(number: number/1000 % 100)
            if numString != "" {
                numberOutputString.append("\(numString)thousand ")
            }
        }
        if (number >= 100) {
            let numString = getWordForNumber(number: number/100 % 10)
            if numString != "" {
                numberOutputString.append("\(numString)hundred ")
            }
            
        }
        
        if number % 100 != 0 && number > 100 {
            
            numberOutputString.append("and")
        }
        numberOutputString.append(" \(getWordForNumber(number: number%100))")
        
        
        return numberOutputString
    }
    
    
}

extension ViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {  //delegate method
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        
        return true
    }
}
