//
//  APIHandler.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/7/24.
//

import Foundation


class APIHandler {
    
    func fetchData(url: URL, completion: @escaping (Result<Data, DemoError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.NoData))
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                completion(.failure(.NoData))
                return
            }
            
            // Print the raw JSON data
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON response: \(jsonString)")
            }
            
            completion(.success(data))
        }.resume()
    }
}


//class APIHandler {
//    func getReels(url: URL, completion: @escaping(Result<Data, DemoError>) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                return completion(.failure(.NoData))
//            }
//
//            // Print the raw response to inspect it
//            if let jsonString = String(data: data, encoding: .utf8) {
//                print("Response JSON: \(jsonString)")
//            }
//
//            completion(.success(data))
//
//        }.resume()
//    }
//
//}
