//
//  ReelsModel.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/6/24.
//

import Foundation

struct ReelsModel: Decodable, Identifiable {
    var id = UUID()
    var title: String
    var videoUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case videoUrl
    }
}


