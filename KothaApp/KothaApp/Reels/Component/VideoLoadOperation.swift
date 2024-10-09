//
//  VideoLoadOperation.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import Foundation

class VideoLoadOperation: Operation {
    
    var videoURL: URL
    var videoData: Data?
    
    init(url: URL) {
        self.videoURL = url
    }
    
    override func main() {
        if isCancelled {
            return }
        // Perform data fetching synchronously
        videoData = try? Data(contentsOf: videoURL)
        if isCancelled {
            return
        }
        // Perform further processing if required
    }
}

