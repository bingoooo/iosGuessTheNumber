//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Benjamin on 25/09/2016.
//  Copyright © 2016 Benjamin Dant. All rights reserved.
//

import UIKit

private var lowerBound = 0
private var upperBound = 100
private var numGuesses = 0
private var secretNumber = 0

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberTxtField.becomeFirstResponder()
        reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var rangeLbl: UILabel!
    @IBOutlet weak var numberTxtField: UITextField!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var numGuessLbl: UILabel!
    
    @IBAction func onOkPressed(sender: AnyObject){
        print(numberTxtField.text)
        let number = Int(numberTxtField.text!)
        if let number = number {
            selectedNumber(number)
        } else {
            messageLbl.text = "Please, put a number"
        }
    }
}

private extension ViewController{
    enum Comparison{
        case Smaller
        case Greater
        case Equals
    }
    
    func selectedNumber(number: Int){
        switch compareNumber(number, otherNumber: secretNumber) {
        case .Equals:
            print("Number Equals")
            numGuesses += 1
            messageLbl.text = "Found It!"
            renderNumGuesses()
            resetData()
        case .Greater:
            print("Number is Greater")
            messageLbl.text = "Your Guess is Greater"
            numGuesses += 1
            upperBound = number
            renderNumGuesses()
            renderRange()
        case .Smaller:
            print("Number is Smaller")
            messageLbl.text = "Your Guess is Smaller"
            numGuesses += 1
            lowerBound = number
            renderNumGuesses()
            renderRange()
        }
    }
    
    func compareNumber(number: Int, otherNumber: Int) -> Comparison {
        if number < otherNumber {
            return .Smaller
        } else if number > otherNumber{
            return .Greater
        }
        return .Equals
    }
}

private extension ViewController{
    func extractSecretNumber(){
        let diff = upperBound - lowerBound
        let randomNumber = Int(arc4random_uniform(UInt32(diff)))
        secretNumber = randomNumber + Int(lowerBound)
    }
    func renderRange(){
        rangeLbl.text = "\(lowerBound) and \(upperBound)"
    }
    func renderNumGuesses(){
        numGuessLbl.text = "Number of Guesses: \(numGuesses)"
    }
    func resetData(){
        lowerBound = 0
        upperBound = 100
        numGuesses = 0
    }
    
    func resetMsg(){
        messageLbl.text = ""
    }
    
    func reset(){
        resetData()
        renderRange()
        renderNumGuesses()
        extractSecretNumber()
        resetMsg()
    }
}

