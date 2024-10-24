//
//  ViewController.swift
//  CrashlyticsANDRemoteConfig
//
//  Created by Hasan Hüseyin Kılıç on 21.10.2024.
//

import UIKit
import FirebaseRemoteConfig
class ViewController: UIViewController {

    private let view1: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.isHidden = true
        return view
    }()
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    private let view2: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.isHidden = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(view1)
        view.addSubview(view2)
        
        fetchvalues()
        
        
        let button = UIButton(type: .roundedRect)
           button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
           button.setTitle("Test Crash", for: [])
           button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
           view.addSubview(button)
       }
    
    func fetchvalues() {
        //shows_new_ui
        
        let defaults : [String: NSObject] = ["shows_new_ui": false as NSObject]
        remoteConfig.setDefaults(defaults)
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        let cachedValue  = self.remoteConfig.configValue(forKey: "shows_new_ui").boolValue
        updateUI(newUI: cachedValue)
        
        self.remoteConfig.fetch(withExpirationDuration: 0, completionHandler: { status ,error in
            if status == .success , error == nil {
                self.remoteConfig.activate { activated ,error  in
                    guard error == nil else { return }
                    let value  = self.remoteConfig.configValue(forKey: "shows_new_ui").boolValue
                 
                    DispatchQueue.main.async {
                        self.updateUI(newUI: value)
                    }
                  
                    
                }
            }
            else{
                print("something went wrong")
            }
            
            
        })
        
    }
    
    func updateUI(newUI: Bool) {
        if newUI ==  true  {
            view2.isHidden = false
            
        }
        else{
            view1.isHidden = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view1.frame = view.bounds
        view2.frame = view.bounds
    }

       @IBAction func crashButtonTapped(_ sender: AnyObject) {
           fatalError("hata mesajı ")
           
       }

}

