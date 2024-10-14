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
        
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name:NSNotification.Name(rawValue: "newData"), object: nil)//bum esajı gordugunde getdatayı calıstıracak , cagıracak
    }
    @objc func getData(){
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false) // bırden fazla kez eklemesın tablevıew a yukarda getdata cagırdıgmız ıcın 
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
//        context.fetch()//cek verileri
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")//veriyi cekme islemi isteği
        fetchRequest.returnsObjectsAsFaults = false // cashten okumada false yaparak daha hızlı yapıyoz. kucuk verile için tabi
        
        do{
            let results = try context.fetch(fetchRequest)// bana geri dondurecek dizi olarak
            for result in results as! [NSManagedObject]{ // CRUD sistemi yapmasına olanak tanır NSManagedObject
                if let name = result.value(forKey: "name") as? String{ // eger name string se  işlem yap
                    self.nameArray.append(name)
                    
                }
                if let id = result.value(forKey: "id") as? UUID{
                    self.idArray.append(id)
                }
                
            }
            
            self.tableView.reloadData()
            
        }
        catch{
            print("error")
        }
        
            
        
    }


    @objc func addButtonClicked(){
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
        
    }
}

