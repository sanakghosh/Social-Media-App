//
//  VideoManager.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import AVFoundation

class VideoManager {
    // Array of video URLs to manage
    private var videos: [URL] = [
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
    
    var networkMonitor: NetworkMonitor?
    private var videoStreamer: VideoStreamer?
    
    private var currentVideoIndex = 0
    private var currentPlayer: AVPlayer?
    private var nextVideoPrebufferer: VideoPrebufferer?

    // Initialize the VideoManager with an AVPlayer instance
    init(player: AVPlayer) {
        self.currentPlayer = player
        
        networkMonitor = NetworkMonitor()
        networkMonitor?.networkStatusChange = { [weak self] status in
            print("Network status changed.")
            switch status {
            case .satisfied:
                print("Network is stable. Standard pre-buffering.")
                self?.videoStreamer?.setupHLSPlayer(with: "https://example.com/hls/video.m3u8")
            case .unsatisfied:
                print("Network is unstable. Reduce pre-buffering.")
                self?.handleUnstableNetwork()
            default:
                print("Network conditions are unknown.")
            }
        }
    }
    
    // Method to handle unstable network conditions
    private func handleUnstableNetwork() {
        // Reduce the preferred buffer amount or switch to a lower quality stream
        videoStreamer?.playerItem?.preferredForwardBufferDuration = 2
        videoStreamer?.player?.pause() // Consider pausing the video if it's continuously buffering
    }
    
    // Function to play the next video in the list
    func playNextVideo() {
        // Loop back to the first video if we've reached the end
        if currentVideoIndex >= videos.count {
            currentVideoIndex = 0
        }
        
        // Get the URL of the current video to play
        let videoURL = videos[currentVideoIndex]
        
        // Increment the index for the next video
        currentVideoIndex += 1
        
        // Create a VideoPrebufferer for the current video and start playback
        let prebufferer = VideoPrebufferer(url: videoURL)
        prebufferer.startPlaybackIfReady(on: currentPlayer!)
        
        // Prepare the next video for playback
        prepareNextVideo()
    }
    
    // Function to prepare the next video for pre-buffering
    private func prepareNextVideo() {
        // Loop back to the first video if we've reached the end
        if currentVideoIndex >= videos.count {
            currentVideoIndex = 0
        }
        
        // Create a new VideoPrebufferer for the next video
        nextVideoPrebufferer = VideoPrebufferer(url: videos[currentVideoIndex])
    }
}

