//
//  ResponseHandler.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/7/24.
//

import Foundation

class ResponseHandler {
    
    func getReels(data: Data, completion: @escaping (Result<[ReelsModel], DemoError>) -> Void) {
        // Try to decode the data into the expected format
        do {
            let jsonResponse = try JSONDecoder().decode([ReelsModel].self, from: data)
            completion(.success(jsonResponse))
            
        } catch {
            completion(.failure(.DecodingError))
        }
    }
}


//if let shortsResults = jsonResponse[""] {
//                completion(.success(shortsResults))
//            } else {
//                completion(.failure(.DecodingError))
//            }

//class ResponseHandler {
//    func getReels(data: Data, completion: @escaping(Result<[ReelsModel], DemoError>) -> Void) {
//
//        let reelResponse = try? JSONDecoder().decode([ReelsModel].self, from: data)
//        if let reelResponse = reelResponse {
//            return completion(.success(reelResponse))
//        }else{
//            completion(.failure(.DecodingError))
//        }
//
//    }
//
//}
