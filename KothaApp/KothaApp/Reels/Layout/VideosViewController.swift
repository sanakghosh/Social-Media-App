//
//  VideosViewController.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import UIKit

class VideosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var collectionView: UICollectionView!
    var videos: [(url: URL, aspectRatio: CGFloat)] = [] // List of video URLs and their aspect ratios
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadVideos()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        // Initialize the collection view
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: "VideoCollectionViewCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Add collection view to the main view
        view.addSubview(collectionView)
        
        // Set up Auto Layout constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: - UICollectionViewDataSource Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count // Return the number of videos
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionViewCell", for: indexPath) as? VideoCollectionViewCell else {
            return UICollectionViewCell() // Return an empty cell if dequeue fails
        }
        
        // Configure the cell with the video URL and aspect ratio
        let video = videos[indexPath.item]
        cell.configure(with: video.url, aspectRatio: video.aspectRatio)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width // Get the width of the collection view
        let video = videos[indexPath.item]
        let height = width / video.aspectRatio // Calculate height based on aspect ratio
        return CGSize(width: width, height: height) // Return size for the cell
    }
    
    // MARK: - Load Videos
    
    private func loadVideos() {
        // Load your videos here
        videos.append((url: URL(string: "https://videos.pexels.com/video-files/8468212/8468212-hd_1080_1920_30fps.mp4")!, aspectRatio: 16/9))
        videos.append((url: URL(string: "https://videos.pexels.com/video-files/9046240/9046240-uhd_1440_2560_24fps.mp4")!, aspectRatio: 4/3))
        videos.append((url: URL(string: "https://videos.pexels.com/video-files/9969035/9969035-hd_1080_1920_25fps.mp4")!, aspectRatio: 4/3))
        videos.append((url: URL(string: "https://videos.pexels.com/video-files/27871292/12250709_1080_1920_60fps.mp4")!, aspectRatio: 4/3))
        videos.append((url: URL(string: "https://videos.pexels.com/video-files/8959051/8959051-hd_1080_1920_25fps.mp4")!, aspectRatio: 4/3))
        videos.append((url: URL(string: "https://videos.pexels.com/video-files/27798120/12227662_1080_1920_30fps.mp4")!, aspectRatio: 4/3))
        videos.append((url: URL(string: "https://videos.pexels.com/video-files/18103913/18103913-hd_1080_1920_60fps.mp4")!, aspectRatio: 4/3))
        videos.append((url: URL(string: "https://videos.pexels.com/video-files/28186719/12322264_1440_2560_60fps.mp4")!, aspectRatio: 4/3))
        videos.append((url: URL(string: "https://videos.pexels.com/video-files/27684480/12204362_1080_1920_60fps.mp4")!, aspectRatio: 4/3))
        
        // Reload the collection view data
        collectionView.reloadData()
    }
}
