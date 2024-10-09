//
//  ReelsViewService.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/6/24.
//

import Foundation
import AVFoundation

class ReelsViewService{
    
    func getReels(completion: @escaping(Result<[ReelsModel], DemoError>) -> Void ) {
        let apiKey = "14a27bd0bcd0cd323b35ad79cf3b493dddf6216b"
        let searchQuery = "raw"
        NetworkManager().getReels(apiKey: apiKey, searchQuery: searchQuery, completion: completion)
    }
    
}
