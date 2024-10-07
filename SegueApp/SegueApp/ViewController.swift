//
//  ViewController.swift
//  SegueApp
//
//  Created by Hasan Hüseyin Kılıç on 6.10.2024.
//

import UIKit

class ViewController: UIViewController {

    var userName = ""
    
    
    @IBOutlet weak var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Lifecycle
        print("viewdidload")
    }
//yaşam döngüleri
    override func viewDidDisappear(_ animated: Bool) {
        print("viewdiddisappear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewwilldisappear")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print("viewwillappear")
        nameText.text = ""
    }

    override func viewDidAppear(_ animated: Bool) {
        print("viewdidappear")
    }

    

    
    @IBAction func nextButton2(_ sender: Any) {
        
        userName = nameText.text!
        //next butonuna tıkladıgında segueyı gerceklestır ve 2. ekrana gec
        performSegue(withIdentifier: "toSecondVC", sender: nil) // bilgi yollama sender . burda ekranı aktarma
        
    }
    //segue olmadan hemen yapılacak ıslemlerı buraya yazabıluyorsun. override edioypz yani üstüne yazıyoruz .
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC"{ // bunu yazmamızın amacı dogru ekranın idsi ile eslestırıp o ekranla ılgılı ıslemlerın yapıldıgı yer gıbi düşünebilirz.
            //as kullanmamlazım
            let destinationVC = segue.destination  as! SecondViewController //gidilen hedef yer neyse onu verıyor
            destinationVC.myName = userName // burada diğer ekrana  burdakı yazıyı veriyi aktardık 
            
            
            
        }
    }
}

