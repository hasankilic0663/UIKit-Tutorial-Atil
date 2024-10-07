//
//  ViewController.swift
//  AlertProject
//
//  Created by Hasan Hüseyin Kılıç on 7.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var password2Text: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signupClicked(_ sender: Any) {
        /*
         //Alert Tanımlama
         let alert = UIAlertController(title: "Error!", message: "Username not found ", preferredStyle: .alert)//alert dıyerek tip belirttik uyartı mesajı dedık
         
         let okButton = UIAlertAction(title: "OK", style: .default ){ (UIAlertAction) in
             //button clicked
             print("button clicked")
             
         }
         alert.addAction(okButton) // olusturdugumuz butonu ekledık gömduk
         self.present(alert, animated: true, completion: nil)//selfpresent göster diyo
         
         */
      
        //burada  biz validation işlemi gibibişey yaptık basta username bossa alert ver dedik sonra password bossa diye alert ver dedik. sonrada 2. password again ilede onu ilk şifre ile eslestirdik ve doğruysa success verdirdik .
        if usernameText.text == "" {
            makeAlert(titleInput: "Error", messageInput: "Username not found")
            }
        else if passwordText.text == "" {
            makeAlert(titleInput: "Error", messageInput: "Password not found")

        }
        else if passwordText.text != password2Text.text {
            makeAlert(titleInput: "Error", messageInput: "Password do not match")

        }
        else{
            makeAlert(titleInput: "Success", messageInput: "Signup successful")
        }
    }
        
    
    //fonksiyon tanımlayarak kodu kısalttık ve daha düzgün temiz kod yazımı yaptık
    func makeAlert(titleInput : String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
        
    }
    


