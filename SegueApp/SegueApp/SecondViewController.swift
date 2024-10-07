//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Hasan Hüseyin Kılıç on 6.10.2024.
//

import UIKit

class SecondViewController: UIViewController {

    
    
    @IBOutlet weak var nameLabel2: UILabel!
    
    var myName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        nameLabel2.text = myName
        
    }
    

    

}
