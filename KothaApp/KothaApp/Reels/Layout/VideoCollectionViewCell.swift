//
//  VideoCollectionViewCell.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import UIKit
import AVFoundation

class VideoCollectionViewCell: UICollectionViewCell {
    var playerLayer: AVPlayerLayer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPlayerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPlayerView() {
        playerLayer = AVPlayerLayer()
        playerLayer?.videoGravity = .resizeAspectFill // Adjusts the video to fill the aspect ratio of the playerLayer
        
        if let layer = playerLayer {
            contentView.layer.addSublayer(layer)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = contentView.bounds // Set the playerLayer frame to match the cell's contentView bounds
    }
    
    func configure(with url: URL, aspectRatio: CGFloat) {
        let player = AVPlayer(url: url)
        playerLayer?.player = player
        player.play() // Start video playback
        
        // Adjust the height of the cell based on the aspect ratio
        if let layout = contentView.superview as? UICollectionViewFlowLayout {
            let width = layout.itemSize.width
            let height = width / aspectRatio
            layout.itemSize = CGSize(width: width, height: height) // Update item size based on aspect ratio
        }
    }
}

