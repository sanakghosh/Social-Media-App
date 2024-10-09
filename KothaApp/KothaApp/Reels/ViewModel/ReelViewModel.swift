//
//  ReelViewModel.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/6/24.
//

import Foundation

class ReelViewModel: ObservableObject{
    
    @Published var reels = [ReelsModel]()
    
    func fetchReels() {
        ReelsViewService().getReels { result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let reels):
                    print("Fetched new reels")
                    self.reels = reels
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}
