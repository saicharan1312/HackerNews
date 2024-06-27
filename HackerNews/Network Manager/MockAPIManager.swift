//
//  MockAPIManager.swift
//  HackerNews
//
//  Created by Sai Charan Thummalapudi on 6/27/24.
//

import Foundation
class MockAPI : APIManager {
    static let sharedInstance = MockAPI()
    override func fetchData (url: String, completion: @escaping (News?,Error?)->()) {
        let mockHitObj = [Hit(author: "Sai", created_at: "12-11-2022", num_comments: 2001, points: 199, title: "iOS development is future", url: "nil")]
        let mockNewsObj = News(hits: mockHitObj)
        completion(mockNewsObj,nil)
    }
}


