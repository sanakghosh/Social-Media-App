//
//  VideoViewController.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import UIKit
import AVFoundation

class VideoViewController: UIViewController {
    
    private var currentPlayer: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleMemoryWarning), name: UIApplication.didReceiveMemoryWarningNotification, object: nil)
        
        let videoManager = VideoManager(player: currentPlayer!)
        videoManager.networkMonitor?.networkStatusChange = { [weak self] status in
            if status == .unsatisfied {
                DispatchQueue.main.async {
                    self?.showNetworkAlert()
                }
            } }
        
    }
    
    
    @objc private func handleMemoryWarning() {
        print("Memory warning received. Clearing cache.")
        MediaCache.shared.clearCache()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
}
