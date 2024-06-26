//
//  APIManager.swift
//  HackerNews
//
//  Created by Sai Charan Thummalapudi on 6/25/24.
//

import Foundation
class APIManager {
    static let shared = APIManager()
    func fetchData (url: String, completion: @escaping (News?,Error?)->()) {
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                if let serverData = data {
                    do{
                        let parsedData = try JSONDecoder().decode(News.self, from: serverData)
                        print(parsedData)
                        completion(parsedData, nil)
                    }
                    catch {
                        print("Decode error")
                    }
                }
            }.resume()
        }
    }
//    func decodeData(data: Data) -> News? {
//        do{
//            let parsedData = try JSONDecoder().decode(News.self, from: data)
//                return parsedData
//        }
//        catch {
//            print("Decode error")
//        }
//        return nil
//    }
}
