//
//  ViewController.swift
//  CocoaPods-Alamofire
//
//  Created by Hasan Hüseyin Kılıç on 15.10.2024.
//

import UIKit
import Toast_Swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.makeToast("Hello World")
    }

    @IBAction func buttonToast(_ sender: Any) {
        view.makeToast("Instgram : @hasankilic0663")
    }
    
}

