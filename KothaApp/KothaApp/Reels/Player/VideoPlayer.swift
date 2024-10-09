//
//  VideoPlayer.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import AVFoundation

class VideoPlayer {
    var player: AVPlayer?          // The AVPlayer instance for video playback
    var playerItem: AVPlayerItem?   // The AVPlayerItem that manages the asset
    
    // Method to set up the player with a given URL
    func setupPlayer(with url: URL) {
        // Create an AVURLAsset with the provided URL
        let asset = AVURLAsset(url: url, options: nil)
        
        // Create an AVPlayerItem using the asset
        self.playerItem = AVPlayerItem(asset: asset)
        
        // Initialize the AVPlayer with the playerItem
        self.player = AVPlayer(playerItem: playerItem)
    }
    
    // Method to start video playback
    func play() {
        player?.play()  // Play the video if the player is initialized
    }
    
    // Method to pause video playback
    func pause() {
        player?.pause() // Pause the video if the player is initialized
    }
}
