//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Hasan Hüseyin Kılıç on 11.10.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var cadLabel: UILabel!
    
    @IBOutlet weak var chfLabel: UILabel!
    

    
    @IBOutlet weak var jpyLabel: UILabel!
    
    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var tryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        
        
        
        
        let url = URL(string : "https://data.fixer.io/api/latest?access_key=8f8ccb45e2a561f0cd68b2bf7570ba0a&format=1")
        
        //haberleşmek için gitmek için session kullanıyoz
        let session  = URLSession.shared  // istek atma
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }else{
                if data != nil {
                    do{
                        let jsonResponse = try  JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any >
                        
                        //ASYNC
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                //print(rates)
                                
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                
                              
                                
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                }
                                
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                
                                if let turkish = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(turkish)"
                                }
                                
                                
                            }
                        }
                        
                    } catch {
                        print("error")
                    }
                   
                    }
            }
        }
            
        task.resume() //taskın calısması ıcın olabılmesı ıcın bununla baslatıyoruz
        
    }
    
}

