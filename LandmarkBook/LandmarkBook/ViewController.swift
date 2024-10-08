//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Hasan Hüseyin Kılıç on 7.10.2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource { //tableview kullanmak ıstıyorsak bu 2 protokolu eklememız lazım
  
    
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self //self = viewcontroller ynai gorunum
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 10 tane gostermek ornek
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {// buradad ne gostercen ıcınde gibi her birine hucre ve bu hucrelerı yazmamız gerekıyo
        let cell = UITableViewCell()
        //cell.textLabel?.text = "test"
        var content = cell.defaultContentConfiguration() //???
        content.text = "TableView"
        content.secondaryText = "Test"
        cell.contentConfiguration = content
        return cell
    }
    
    
}

