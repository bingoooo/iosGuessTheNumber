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
private var numberOfGuesses = 0
private var secretNumber = 0

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var rangeLbl: UILabel!
    @IBOutlet weak var numberTxtField: UITextField!
    @IBOutlet weak var mesageLbl: UILabel!
    @IBOutlet weak var numGuessLbl: UILabel!
    
    @IBAction func onOkPressed(sender: AnyObject){
        print(numberTxtField.text)
    }
}

private extension ViewController{
    enum Comparison{
        case Smaller
        case Greater
        case Equals
    }
    
    func selectedNumber(number: Int){
        
    }
    
    func compareNumber(number: Int, otherNumber: Int) -> Comparison {
        return Comparison.Equals
    }
}

