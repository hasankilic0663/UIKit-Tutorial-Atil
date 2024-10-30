//
//  ViewController.swift
//  HaberProjesi
//
//  Created by Hasan Hüseyin Kılıç on 28.10.2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
  
    

    @IBOutlet weak var tableView: UITableView!
    
    private var newsTableViewModel: NewsTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
       
        tableView.rowHeight = UITableView.automaticDimension // OTOMATIK YUKSEKLIK AYARLA
        tableView.estimatedRowHeight = UITableView.automaticDimension//tahmın edılen yukseklık otomatıc
        veriAl()
       
    }
    
    func veriAl(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
   
        Webservice().haberleriIndir(url: url!) { haberler in
            if let haberler = haberler {
//                print(haberler)
                
                self.newsTableViewModel = NewsTableViewModel(newsList: haberler)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : newsTableViewModel.numberofRowsInSection() // boş gelirse diye
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        as! NewsCell
       // cell.titleLabel
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(indexPath.row)
        
        cell.titleLabel.text = newsViewModel.title
        cell.storyLabel.text = newsViewModel.story
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { // otomatık yukseklık ıcın
        return UITableView.automaticDimension
    }
}

