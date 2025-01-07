//
//  ViewController.swift
//  DarkModeApp
//
//  Created by Hasan Hüseyin Kılıç on 7.01.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .light // bu dark mode aktif bile olsa bunu light mode a ceviriyo
    }
    override func viewWillAppear(_ animated: Bool) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        
        
        if userInterfaceStyle == .dark {
            changeButton.tintColor = .white
            
        }else{
            changeButton.tintColor = .purple
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        
        //anlık darkmode a geçişi alıglıyor
        if userInterfaceStyle == .dark {
            changeButton.tintColor = .white
            else{
        }
            changeButton.tintColor = .purple
        }
    }

}

