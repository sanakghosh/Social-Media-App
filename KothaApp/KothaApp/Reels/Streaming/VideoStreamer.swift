//
//  VideoStreamer.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import AVFoundation

class VideoStreamer {
    var player: AVPlayer?
    var playerItem: AVPlayerItem?
    
    // Function to set up the HLS player with a given URL string
    func setupHLSPlayer(with urlString: String) {
        // Ensure the URL string can be converted to a valid URL
        guard let url = URL(string: urlString) else {
            print("Invalid URL string.")
            return
        }

        let asset = AVURLAsset(url: url)
        let keys = ["playable"]
        
        // Load the asset's playable status asynchronously
        asset.loadValuesAsynchronously(forKeys: keys) {
            var error: NSError? = nil
            let status = asset.statusOfValue(forKey: "playable", error: &error)

            switch status {
            case .loaded:
                // If the asset is playable, create the player item on the main thread
                DispatchQueue.main.async {
                    self.createPlayerItem(with: asset)
                }
            case .failed:
                // Handle failure to load the asset
                print("Failed to load asset: \(error?.localizedDescription ?? "Unknown error")")
            default:
                break
            }
        }
    }

    // Function to create an AVPlayerItem and start playback
    private func createPlayerItem(with asset: AVURLAsset) {
        self.playerItem = AVPlayerItem(asset: asset)
        self.player = AVPlayer(playerItem: playerItem)
        self.player?.play()  // Automatically start playback
    }
}

