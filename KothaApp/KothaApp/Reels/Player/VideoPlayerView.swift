//
//  VideoPlayerView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import SwiftUI
import AVKit
import AVFoundation

struct VideoPlayerView: UIViewRepresentable {
    
    var url: URL
    
    // Create the UIView to represent
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero, url: url)
    }
    
    // Update the UIView when the SwiftUI state changes
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    // PlayerUIView that manages AVPlayerLayer and plays the video
    class PlayerUIView: UIView, AVAssetDownloadDelegate {
        private var playerLayer = AVPlayerLayer()
        private var player: AVPlayer?
//        private var url: URL?
        
        init(frame: CGRect, url: URL) {
            super.init(frame: frame)
            setupPlayer(url: url)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // Setup the AVPlayer and AVPlayerLayer
        private func setupPlayer(url: URL) {
            self.player = AVPlayer(url: url)
            self.playerLayer.player = player
            self.playerLayer.videoGravity = .resizeAspectFill
            self.layer.addSublayer(playerLayer)
            player?.play()  // Auto-start playback
            prefetchNextVideos(urls: [url])
            
            let queue = OperationQueue()
            let loadOperation = VideoLoadOperation(url: url)
            queue.addOperation(loadOperation)
            
            
            let videoPlayer = VideoPlayer()
            videoPlayer.setupPlayer(with: url)
            videoPlayer.play()
//            if let videoURL =  URL(string: "https://videos.pexels.com/video-files/8468212/8468212-hd_1080_1920_30fps.mp4"){
//                videoPlayer.setupPlayer(with: videoURL)
//                videoPlayer.play()  // Start playback
//            }
            
            let videoStreamer = VideoStreamer()
            videoStreamer.setupHLSPlayer(with: "https://videos.pexels.com/video-files")

            
        }
        
//        func loadVideoContent() {
//            DispatchQueue.global(qos: .userInitiated).async {
//                // Simulate a network operation to fetch video data
//                if let videoData = self.downloadVideoData() {
//                    DispatchQueue.main.async {
//                        // Update UI on the main thread
//                        self.playerView.playVideo(data: videoData)
//                    }
//                } else {
//                    DispatchQueue.main.async {
//                        // Handle failure to download video data (e.g., show error)
//                        self.showDownloadError()
//                    }
//                }
//            }
//        }
        
//        private func downloadVideoData() -> Data? {
//            // Fetch video data from a remote server
//            do {
//                let videoData = try Data(contentsOf: url)
//                return videoData
//            } catch {
//                print("Failed to download video data: \(error)")
//                return nil
//            }
//        }
        
        private func showDownloadError() {
            // Handle UI updates for download failure (e.g., show an alert)
            print("Failed to download video")
        }
        
        func prefetchNextVideos(urls: [URL]) {
            urls.forEach { startDownload(for: $0) }
        }
        
        func startDownload(for url: URL) {
            // Create an AVURLAsset using the video URL
            let asset = AVURLAsset(url: url)
            
            // Configure a background URL session for downloading the video
            let configuration = URLSessionConfiguration.background(withIdentifier: "\(Bundle.main.bundleIdentifier!).background")
            
            // Create a URLSession with AVAssetDownloadURLSession for media download
            let session = AVAssetDownloadURLSession(configuration: configuration, assetDownloadDelegate: self, delegateQueue: OperationQueue())
            
            // Create the download task, specifying the asset and download options
            let downloadTask = session.makeAssetDownloadTask(asset: asset, assetTitle: "VideoTitle", assetArtworkData: nil, options: [AVAssetDownloadTaskMinimumRequiredMediaBitrateKey: 265_000])
            
            // Start/resume the download task
            downloadTask?.resume()
        }
        
        // Update the layer when the view's layout changes
        override func layoutSubviews() {
            super.layoutSubviews()
            playerLayer.frame = self.bounds
        }
    }
}

