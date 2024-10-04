//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Hasan Hüseyin Kılıç on 4.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var resultText: UITextField!
    
    @IBOutlet weak var firsttextt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sumClicked(_ sender: Any) {
        
        if  let firstNumber = Int(firsttextt.text!) {
            
           if let secondNumber = Int(secondText.text!){
                
                let result = firstNumber + secondNumber
                resultText.text = String(result)
            }
            
            
        }
        
      
        
      
        
    }
    
    @IBAction func minusClicked(_ sender: Any) {
    }
    
    
    @IBAction func multipyClicked(_ sender: Any) {
    }
    
    @IBAction func divideClicked(_ sender: Any) {
    }
}

