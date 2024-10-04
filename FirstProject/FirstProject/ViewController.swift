//
//  ViewController.swift
//  FirstProject
//
//  Created by Hasan Hüseyin Kılıç on 3.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: Any) {
        
        imageView.image = UIImage(named: "mvö") // butona tıklandıgında resmı ısmı ekledigimiz  resımle degıstırıyo
    }//butona tıklanınca olacak seyler burası
    
}

