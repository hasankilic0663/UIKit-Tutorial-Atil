//
//  ViewController.swift
//  SegueApp
//
//  Created by Hasan Hüseyin Kılıç on 6.10.2024.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func nextButton2(_ sender: Any) {
        performSegue(withIdentifier: "toSecondVC", sender: nil) // bilgi yollama sender . burda ekranı aktarma
        
    }
    //segue olmadan hemen yapılacak ıslemlerı buraya yazabıluyorsun 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
}

