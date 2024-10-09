//
//  NetworkManager.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/6/24.
//

import Foundation
import SwiftUI

enum DemoError: Error {
    case BadURL
    case NoData
    case DecodingError
}

class NetworkManager {
    
    let apiHandler: APIHandler
    let responseHandler: ResponseHandler
    
    init(apiHandler: APIHandler = APIHandler(),
         responseHandler: ResponseHandler = ResponseHandler()){
        self.apiHandler = apiHandler
        self.responseHandler = responseHandler
    }
    
    func getReels(apiKey: String, searchQuery: String, completion: @escaping (Result<[ReelsModel], DemoError>) -> Void) {
        
        // Construct URL
        guard let url = URL(string: "https://gist.githubusercontent.com/poudyalanil/ca84582cbeb4fc123a13290a586da925/\(searchQuery)/\(apiKey)/videos.json") else {
            return completion(.failure(.BadURL))
        }
        
        // Fetch data using APIHandler
        apiHandler.fetchData(url: url) { result in
            switch result {
            case .success(let data):
                // Pass the data to ResponseHandler for decoding
                self.responseHandler.getReels(data: data) { decodedResult in
                    switch decodedResult {
                    case .success(let shortsResults):
                        completion(.success(shortsResults))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}



//class NetworkManager {
//
//    let aPIHandler: APIHandler
//    let responseHandler: ResponseHandler
//
//    init(aPIHandler: APIHandler = APIHandler(),
//         responseHandler: ResponseHandler = ResponseHandler()){
//        self.aPIHandler = aPIHandler
//        self.responseHandler = responseHandler
//    }
//
//    func getReels( completion: @escaping(Result<[ReelsModel], DemoError>) -> Void) {
//
//        guard let url = URL(string: "https://serpapi.com/search.json?engine=youtube&search_query=shoes") else {
//            return completion(.failure(.BadURL))
//        }
//
//        aPIHandler.getReels(url: url) { result in
//            switch result {
//            case .success(let data):
//                self.responseHandler.getReels(data: data) { decodedResult in
//                    switch decodedResult {
//                    case .success(let model):
//                        completion(.success(model))
//                    case .failure(let error):
//                        completion(.failure(error))
//                    }
//                }
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//
//    }
//
//}

