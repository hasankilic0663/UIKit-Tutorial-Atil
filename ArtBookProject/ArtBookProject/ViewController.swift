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
    var selectedPainting = ""
    var selectedPaintingId :  UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector (addButtonClicked))//barbutton olusturma sag ust koseye yani                         System ıtemde add secerek + gorunumu cıkarıyo kamera
        
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name:NSNotification.Name(rawValue: "newData"), object: nil)//bum esajı gordugunde getdatayı calıstıracak , cagıracak// observer gozlemcı eklemektir . viewwillapperar kullanmamızın amacı uyg calsıtıgı surece calısıyo
    }
    @objc func getData(){
        nameArray.removeAll(keepingCapacity: false)//notifcationcenterdan dolayı sureklı getdataa cagırırken eskılerı sılsın
        
        idArray.removeAll(keepingCapacity: false) // bırden fazla kez eklemesın tablevıew a yukarda getdata cagırdıgmız ıcın
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
//        context.fetch()//cek verileri
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")//veriyi cekme islemi isteği
        fetchRequest.returnsObjectsAsFaults = false // cashten okumada false yaparak daha hızlı yapıyoz. kucuk verile için tabi
        
        do{
            let results = try context.fetch(fetchRequest)// bana geri dondurecek dizi olarak
            for result in results as! [NSManagedObject]{ // CRUD sistemi yapmasına olanak tanır NSManagedObject , cast etmem gerekiypr.
                if let name = result.value(forKey: "name") as? String{ // eger name string se  işlem yap
                    self.nameArray.append(name)
                    
                }
                if let id = result.value(forKey: "id") as? UUID{
                    self.idArray.append(id)
                }
                
            }
            
            self.tableView.reloadData()//yeni bir veri geldiğinde kendisini guncellemek ıcın yazıyoruz 
            
        }
        catch{
            print("error")
        }
        
            
        
    }


    @objc func addButtonClicked(){
        selectedPainting = ""
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.chosenPainting = selectedPainting//aktarma yaptık 
            destinationVC.chosenPaintingId = selectedPaintingId
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {//tıklandıgında napacaz listedeki eklediklerimize tıklarsak
        selectedPainting = nameArray[indexPath.row]
        selectedPaintingId = idArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appdelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")//fetchlememızın amacı fetchleyıp sılıyoruz
            let idString = idArray[indexPath.row].uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            
            fetchRequest.returnsObjectsAsFaults = false
            
            if let result = try? context.fetch(fetchRequest){
                for results in result as! [NSManagedObject]{
                    if let id = results.value(forKey: "id") as? UUID{
                        if id == idArray[indexPath.row]{
                            context.delete(results)
                            nameArray.remove(at: indexPath.row)
                            idArray.remove(at: indexPath.row)
                            self.tableView.reloadData()
                            do{
                                try context.save()
                            }catch{
                                print("Error")
                            }
                            break // sureklı yapmasın dıye ıfe gırdıyse break dıyıp fordan cıkıyruz
                            
                        }
                    }
                    
                }
            }
        }
    }
}

