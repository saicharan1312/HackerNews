//
//  Model.swift
//  HackerNews
//
//  Created by Sai Charan Thummalapudi on 6/25/24.
//

import Foundation

struct News: Codable {
    let hits: [Hit]?
}

struct Hit: Codable {
    let author: String?
    let created_at: String?
    let num_comments: Int?
    let points: Int?
    let title: String?
    let url: String?
}

