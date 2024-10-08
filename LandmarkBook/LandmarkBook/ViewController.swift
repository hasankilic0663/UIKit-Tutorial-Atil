//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Hasan Hüseyin Kılıç on 7.10.2024.
//

import UIKit

//delegasyon ve veri yapsıını ekledık tablevıewın bunu vıewcontrllera verdik s
class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource { //tableview kullanmak ıstıyorsak bu 2 protokolu eklememız lazım
  
    
    

    @IBOutlet weak var tableView: UITableView!
    
    
    var landmarkNames = [String]()
    
    
    var landmarkImages: [UIImage] = []
    var chosenLandmarkImage =  UIImage()
    var chosenLandmarkName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self //self = viewcontroller ynai gorunum
        
       
        landmarkNames.append("Kelebekler Vadisi")
        landmarkNames.append("Kaputaj Plajı")
        landmarkNames.append("Kaş Plajı")
        landmarkNames.append("Erikli Plajı")

        
        landmarkImages.append(UIImage(named: "kelebekler")!)
        landmarkImages.append(UIImage(named: "kaputaj")!)
        landmarkImages.append(UIImage(named: "images")!)
        landmarkImages.append(UIImage(named: "erikli")!)
        
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 10 tane gostermek ornek
        return landmarkNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {// buradad ne gostercen ıcınde gibi her birine hucre ve bu hucrelerı yazmamız gerekıyo
        let cell = UITableViewCell()
        //cell.textLabel?.text = "test"
//        var content = cell.defaultContentConfiguration() //???
        cell.textLabel?.text = landmarkNames[indexPath.row]//hangı sıradaysa o gozukur
      
//        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {//bir hucre secıldıgı anda napacak kısmı
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: "nil")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC  //gidilecek hedef viewcontroller ve gideleck yer detailsvc as ile emin oluyoz
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            destinationVC.selectedLandmarkName = chosenLandmarkName//burada detaılsvcye baglayı aktraıyoz
            
            
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {//bu bıze editingsytle veriyo . bu deletemı ınsertmı yapmaya calısıyo bunu gosterıyor
        if editingStyle == .delete{
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            
            //Bu aşagıdaki iki satırda olur ama suan deleteRows kullanmay ıtercih ettik
            
            
           // tableView.reloadData()//veriyi aldıgında veriler değişti demek ama 1000 tane olsa bosa
            tableView.deleteRows(at: [indexPath], with: .fade)//bunda ıse secılı olan silincek
            
            
            
        }
    }
}

