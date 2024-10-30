//
//  Webservice.swift
//  HaberProjesi
//
//  Created by Hasan Hüseyin Kılıç on 28.10.2024.
//

import Foundation

class Webservice{
    
    func haberleriIndir(url : URL , completion : @escaping ([News]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error  = error{
                print(error.localizedDescription)
                completion(nil)
            } else if let  data = data{
                let haberlerDizisi = try? JSONDecoder().decode([News].self, from: data) //hangi sınıftan yapacagımızı sordugu ıcın self diyoruz.
                
                if let haberlerDizisi = haberlerDizisi{
                    completion(haberlerDizisi)
                    
                }
                
            }
        }.resume() // başlatmak ıcın kullanıcaz
        
        
    }
    
}
