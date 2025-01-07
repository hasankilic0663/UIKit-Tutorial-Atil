//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Hasan Hüseyin Kılıç on 4.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.ekranın basladıgı yer
        
        let storedName = UserDefaults.standard.object(forKey: "name") // opsiyonel veriyor
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        
        //
        if let newName = storedName as? String
        {
            nameLabel.text = "Name: \(newName)"
        }// storedName as ile cevirebiliyorsan stringe cevir
        
        if let newBirthday = storedBirthday as? String // burdada aynıısı as ıle cevırebılıyorsan strınge cevır
        {
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }
        
        
//        nameLabel.text = "Name: \(storedName!)" // burada Castin
//        birthdayLabel.text = "Birthday: \(storedBirthday!)"
//        
//        
    }

    @IBAction func saveClicked(_ sender: Any) {//butonu buraya tanımlama
        
        
        
        //UserDefaults ile geçici kaydediyoruz
        UserDefaults.standard.set(nameTextField.text , forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text , forKey: "birthday")
        //UserDefaults.standard.synchronize()   bunu artık kullanmıyoruz
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
    }
    
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil
        {
            UserDefaults.standard.removeObject(forKey: "name")//burada removeObject ıle name degerındekı keyı sılıyor yanı tuttugu veriyi
            nameLabel.text = "Name: "
        }
        
        if (storedBirthday as? String) != nil
        {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday: "
        }
        
      
    }
    
}

