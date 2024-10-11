//
//  ViewController.swift
//  ArtBookProject
//
//  Created by Hasan Hüseyin Kılıç on 10.10.2024.
//

import UIKit
import CoreData

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    var nameArray = [String]()
    var idArray = [UUID]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector (addButtonClicked))//barbutton olusturma sag ust koseye yani                         System ıtemde add secerek + gorunumu cıkarıyo kamera
    }
    
    func getData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
//        context.fetch()//cek verileri
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)// bana geri dondurecek dizi olarak
        }
        catch{
        }
        
            
        
    }


    @objc func addButtonClicked(){
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "test"
        return cell
        
    }
}

