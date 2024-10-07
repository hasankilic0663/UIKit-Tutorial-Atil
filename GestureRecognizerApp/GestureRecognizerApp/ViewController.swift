//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Hasan Hüseyin Kılıç on 7.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var myLabe: UILabel!
    var isElraen = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.isUserInteractionEnabled = true // image e tıklanabilsinmi
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        imageView.addGestureRecognizer(gestureRecognizer)
        
        
    }//bu bolumun amacı tıkladıgında toggle gıbı ıslev görüyo
    @objc func changePic(){
        if isElraen{
            imageView.image = UIImage(named: "elraen")
            myLabe.text = "Elraen BABA"
            isElraen = false
        }
        else{
            imageView.image = UIImage(named: "james")
            myLabe.text = "james"
            isElraen = true
        }
        
    }


}

