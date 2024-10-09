//
//  VideoPrebufferer.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import AVFoundation

class VideoPrebufferer: NSObject {
    var playerItem: AVPlayerItem?
    
    // Initialize with a URL to create an AVPlayerItem
    init(url: URL) {
        super.init()
        let asset = AVURLAsset(url: url)
        let keys = ["playable", "hasProtectedContent"]
        playerItem = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: keys)
        
        // Set how much media to buffer before playing
        playerItem?.preferredForwardBufferDuration = 5
        
        // Add observers to monitor the status of the player item
        addObserver()
    }
    
    private func addObserver() {
        // Observe loadedTimeRanges and status properties
        playerItem?.addObserver(self, forKeyPath: "loadedTimeRanges", options: .new, context: nil)
        playerItem?.addObserver(self, forKeyPath: "status", options: .new, context: nil)
    }
    
    deinit {
        removeObserver() // Ensure observers are removed on deinit
    }
    
    private func removeObserver() {
        // Remove observers for loadedTimeRanges and status properties
        playerItem?.removeObserver(self, forKeyPath: "loadedTimeRanges")
        playerItem?.removeObserver(self, forKeyPath: "status")
    }
    
    // Handling Key-Value Observing Callback
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let playerItem = object as? AVPlayerItem else { return }
        
        // Handle changes for loadedTimeRanges
        if keyPath == "loadedTimeRanges", let timeRanges = playerItem.loadedTimeRanges as? [CMTimeRange], let first = timeRanges.first {
            let bufferedTime = CMTimeGetSeconds(first.end)
            print("Buffered up to \(bufferedTime) seconds")
        }
        // Handle changes for status
        else if keyPath == "status" {
            switch playerItem.status {
            case .readyToPlay:
                print("Player item is ready to play")
            case .failed:
                print("Player item failed with error: \(String(describing: playerItem.error?.localizedDescription))")
            default:
                break
            }
        }
    }
    
    // Start playback if the player item is ready
    func startPlaybackIfReady(on player: AVPlayer) {
        guard let item = playerItem, item.status == .readyToPlay else { return }
        player.replaceCurrentItem(with: item)
        player.play()
    }
}
