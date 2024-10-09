//
//  SwipeableView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import SwiftUI
import UIKit
import AVKit

// SwipeableView is a SwiftUI wrapper for the UIPageViewController
struct SwipeableView: UIViewControllerRepresentable {
    var urls: [URL]
    
    func makeUIViewController(context: Context) -> UIViewController {
        return SwipeablePageViewController(urls: urls)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update logic if needed, no-op for now
    }
    
    // SwipeablePageViewController for handling the swiping of videos
    class SwipeablePageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var urls: [URL]
        
        // Initialize with the list of video URLs
        init(urls: [URL]) {
            self.urls = urls
            super.init(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
            self.dataSource = self
            self.delegate = self
            
            // Set the first video view controller
            if let firstViewController = viewControllerAtIndex(0) {
                setViewControllers([firstViewController], direction: .forward, animated: true)
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // Return the previous video view controller if it exists
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let videoViewController = viewController as? VideoViewController,
                  let index = urls.firstIndex(of: videoViewController.url),
                  index > 0 else { return nil }
            return viewControllerAtIndex(index - 1)
        }
        
        // Return the next video view controller if it exists
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let videoViewController = viewController as? VideoViewController,
                  let index = urls.firstIndex(of: videoViewController.url),
                  index < urls.count - 1 else { return nil }
            return viewControllerAtIndex(index + 1)
        }
        
        // Helper to create a VideoViewController at a given index
        private func viewControllerAtIndex(_ index: Int) -> UIViewController? {
            guard index >= 0 && index < urls.count else { return nil }
            return VideoViewController(url: urls[index])
        }
        
        // VideoViewController to handle individual video playback
        class VideoViewController: UIViewController {
            var url: URL
            
            init(url: URL) {
                self.url = url
                super.init(nibName: nil, bundle: nil)
            }
            
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
            
            // Use a custom PlayerUIView to load the video
            override func loadView() {
                self.view = PlayerUIView(frame: .zero, url: url)
            }
        }
    }
}

// PlayerUIView handles the actual video playback using AVPlayer
class PlayerUIView: UIView {
    private var playerLayer = AVPlayerLayer()
    private var player: AVPlayer?
    
    init(frame: CGRect, url: URL) {
        super.init(frame: frame)
        setupPlayer(url: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup the AVPlayer and AVPlayerLayer to play video
    private func setupPlayer(url: URL) {
        self.player = AVPlayer(url: url)
        self.playerLayer.player = player
        self.playerLayer.videoGravity = .resizeAspectFill
        self.layer.addSublayer(playerLayer)
        player?.play()  // Auto-play video
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = self.bounds
        
        
    }
    
}

