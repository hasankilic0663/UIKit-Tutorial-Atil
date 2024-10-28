//
//  ViewController.swift
//  HaberProjesi
//
//  Created by Hasan Hüseyin Kılıç on 28.10.2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
  
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        as! NewsCell
       // cell.titleLabel
        return cell
    }
}

