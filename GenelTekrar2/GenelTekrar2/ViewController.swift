//
//  ViewController.swift
//  GenelTekrar2
//
//  Created by Hasan Hüseyin Kılıç on 15.10.2024.
//

import UIKit
import CoreData

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var nameArray  = [String]()
    var idArray  = [UUID]()
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Oyun", style: .plain, target: self, action: #selector(actionButtonClicked))
    }
    
    func getData() {
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequset = NSFetchRequest<NSFetchRequestResult>(entityName: "ArtBook")
        fetchRequset.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(fetchRequset)
            for results in result as! [NSManagedObject] {
                nameArray.append(results.value(forKey: "name") as! String)
                idArray.append(results.value(forKey: "id") as! UUID)
            }
            self.
        }catch{
            print("Error")
        }
        
    }
    @objc func addButtonClicked(){
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    @objc func actionButtonClicked(){
        
        performSegue(withIdentifier: "toCatchkenny", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Test"
        return cell
    }
}

