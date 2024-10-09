//
//  Simpson.swift
//  SimpsonBook
//
//  Created by Hasan Hüseyin Kılıç on 9.10.2024.
//

import Foundation
import UIKit

class Simpson{
    var name :String//preporty

    var job :String
    var image : UIImage
    
    init(simpsonName: String, simpsonJob: String, simpsonImage: UIImage) {//initlaize etmemiz gerekiyor default değer vermediğimizden dolayı
        self.name = simpsonName
        self.job =  simpsonJob
        self.image = simpsonImage
    }
}
