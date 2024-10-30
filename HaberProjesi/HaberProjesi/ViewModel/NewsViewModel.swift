//
//  NewsViewModel.swift
//  HaberProjesi
//
//  Created by Hasan Hüseyin Kılıç on 28.10.2024.
//

import Foundation


struct NewsTableViewModel {
    let newsList: [News]
    
    
}

extension NewsTableViewModel {
    func numberofRowsInSection() -> Int {
        return self.newsList.count
    }
    
    func newsAtIndexPath(_ index: Int) -> NewsViewModel {
        let news = self.newsList[index]
        return NewsViewModel(news: news)
        
    }
}


struct NewsViewModel {
    let news: News
    
    var title: String {
        return self.news.title
    }
    
    var story : String {
        return self.news.story
    }
}
