//
//  ViewController.swift
//  ObjectWithCode
//
//  Created by Hasan Hüseyin Kılıç on 4.10.2024.
//

import UIKit

class ViewController: UIViewController {

    var mylabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        mylabel.text = "Hello World"
        mylabel.textColor = .red
        mylabel.textAlignment = .center
        mylabel.frame = CGRect(x: 100, y: 100, width: 100, height: 100) // genıslık uzunluk ve x y eksenınde nerede durucak bunu bıze gosterıyor
        view.addSubview(mylabel)
        
        let myButton = UIButton()
        myButton.setTitle("MyButton", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        myButton.frame = CGRect(x: 200 * 0.4, y: 100 * 0.7, width: 100, height: 100)
        view.addSubview(myButton)
        myButton.addTarget(self, action:   #selector(ViewController.myAction), for: .touchUpInside)
    }

    @objc func myAction() {
        mylabel.text = "labeli değiştirdikkkk"
    }

}

