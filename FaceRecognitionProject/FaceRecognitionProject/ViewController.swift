//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Hasan Hüseyin Kılıç on 7.01.2025.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func clicked(_ sender: Any) {
        
        let authContext = LAContext()//doğrulama contexti
        
        var error : NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            DispatchQueue.main.async {
                authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?"){
                    (success ,error ) in
                    if success == true {
                        self.performSegue(withIdentifier: "segue", sender: nil)
                    }
                    else {
                        self.myLabel.text = "Authentication failed"
                    }
                }
            }
            
            
            
        }//biometrik dogrulama yapıyoz{

        
        
        
    }
    

}

