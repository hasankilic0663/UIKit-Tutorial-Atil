//
//  View.swift
//  CryptoViper
//
//  Created by Hasan Hüseyin Kılıç on 19.11.2024.
//

import Foundation
import UIKit

// TAlks to  -> presenter
//Class , protocol
//ViewController

protocol AnyView {
    var presenter : AnyPresenter? { get set }
    
    func update(with cryptos: [Crypto])
    func update (with error: String)
}


class CryptoViewController: UIViewController ,AnyView , UITableViewDelegate , UITableViewDataSource {
   
    
   
    var cryptos: [Crypto] = []
    
    var presenter: AnyPresenter?
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    private let messageLabel : UILabel = {
        let label = UILabel()
        label.text = "Downloading data..."
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.isHidden = false
        return label
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds// ekranımız ne kadarsa tablevıew okadar olacak
        messageLabel.frame = CGRect(x: view.frame.width/2 - 100 , y: 50, width: view.bounds.width  , height: 100 )
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cryptos[indexPath.row].currency
        content.secondaryText = cryptos[indexPath.row].price // burada 1. ve 2. satırında ne gozuksun dıye ayarlıyoruz
        
//        cell.background
        
        return cell
    }
    
    func update(with cryptos: [Crypto]) {
        DispatchQueue.main.async {
            self.cryptos = cryptos
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
            print(cryptos)
        }
    }
    
//    func update(with error: String) {
//        <#code#>
//    }
    func update(with error: String) {
//        DispatchQueue.main.async {
//            self.cryptos = []
//            self.tableView.isHidden = true
//            self.messageLabel.isHidden = false
//            self.messageLabel.text = error
   //     }
    }
    
}

