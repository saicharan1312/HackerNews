//
//  NewsViewModel.swift
//  HackerNews
//
//  Created by Sai Charan Thummalapudi on 6/25/24.
//

import Foundation
class NewsViewModel {
    private var newsArr: [Hit] = []
    func fetchData(url: String, complete: @escaping ()->()) {
        APIManager.shared.fetchData(url: url) { news, error in
        // MockAPI.sharedInstance.fetchData(url: url) { news, error in
            if let newsData = news?.hits {
                self.newsArr = newsData
                print(self.newsArr.count)
                complete()
            }
        }
    }
    
    func getCountTotalNews() -> Int {
        return newsArr.count
    }
    
    func getNewsFor(row: Int) -> Hit {
        return newsArr[row]
    }
}
