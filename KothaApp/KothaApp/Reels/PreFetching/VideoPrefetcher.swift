//
//  VideoPrefetcher.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import Foundation
import Network
import AVFoundation

class VideoPrefetcher {
    let monitor = NWPathMonitor()
    var isAllowedToUseCellularData = false  // This should be set based on user preferences

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            
            if path.status == .satisfied {
                if path.isExpensive && !self.isAllowedToUseCellularData {
                    print("Cellular data is expensive and not allowed")
                } else {
                    self.prefetchVideos()
                }
            } else {
                print("No network connection")
            }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }

    func prefetchVideos() {
        let videoURLs = [
            URL(string: "https://videos.pexels.com/video-files/8468212/8468212-hd_1080_1920_30fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/9046240/9046240-uhd_1440_2560_24fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/9969035/9969035-hd_1080_1920_25fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/27871292/12250709_1080_1920_60fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/8959051/8959051-hd_1080_1920_25fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/27798120/12227662_1080_1920_30fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/18103913/18103913-hd_1080_1920_60fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/28186719/12322264_1440_2560_60fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/27684480/12204362_1080_1920_60fps.mp4")!
        ]
        
        videoURLs.forEach { url in
            let delegate = CustomResourceLoaderDelegate(cache: MediaCache.shared)
            let customURLString = "customscheme://\(url.absoluteString)"
            
            if let customURL = URL(string: customURLString) {
                let asset = AVURLAsset(url: customURL, options: nil)
                asset.resourceLoader.setDelegate(delegate, queue: DispatchQueue.main)
                
                // You might need to access part of the asset to trigger downloading
                asset.loadValuesAsynchronously(forKeys: ["playable"]) {
                    var error: NSError? = nil
                    let status = asset.statusOfValue(forKey: "playable", error: &error)
                    if status == .loaded {
                        print("Video prefetching started for \(url.absoluteString)")
                    } else {
                        print("Failed to load asset for \(url.absoluteString): \(String(describing: error))")
                    }
                }
            }
        }
    }
}

