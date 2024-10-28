//
//  News.swift
//  HaberProjesi
//
//  Created by Hasan Hüseyin Kılıç on 28.10.2024.
//

import Foundation

//Codable - hem decodable hem encodable
struct News : Codable{ // apiler için model tanımlıyoruz
    let title : String
    let story : String
}
