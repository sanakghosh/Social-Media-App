//
//  VideoModel.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/7/24.
//

import AVKit

struct Video: Identifiable{
    var id: Int
    var player: AVPlayer
    var replay: Bool
}

var data = [
    Video(id: 0, player: AVPlayer(url: URL(string: "https://videos.pexels.com/video-files/8468212/8468212-hd_1080_1920_30fps.mp4")!), replay: true),
    Video(id: 1, player: AVPlayer(url: URL(string: "https://videos.pexels.com/video-files/9046240/9046240-uhd_1440_2560_24fps.mp4")!), replay: true),
    Video(id: 2, player: AVPlayer(url: URL(string: "https://videos.pexels.com/video-files/9969035/9969035-hd_1080_1920_25fps.mp4")!), replay: true),
    Video(id: 3, player: AVPlayer(url: URL(string: "https://videos.pexels.com/video-files/27871292/12250709_1080_1920_60fps.mp4")!), replay: true),
    Video(id: 4, player: AVPlayer(url: URL(string: "https://videos.pexels.com/video-files/28478469/12393352_1440_2560_60fps.mp4")!), replay: true),
    Video(id: 5, player: AVPlayer(url: URL(string: "https://videos.pexels.com/video-files/8959051/8959051-hd_1080_1920_25fps.mp4")!), replay: true),
    Video(id: 6, player: AVPlayer(url: URL(string: "https://videos.pexels.com/video-files/27798120/12227662_1080_1920_30fps.mp4")!), replay: true),
    Video(id: 7, player: AVPlayer(url: URL(string: "https://videos.pexels.com/video-files/18103913/18103913-hd_1080_1920_60fps.mp4")!), replay: true),
    Video(id: 8, player: AVPlayer(url: URL(string: "https://videos.pexels.com/video-files/28186719/12322264_1440_2560_60fps.mp4")!), replay: true),
    Video(id: 9, player: AVPlayer(url: URL(string: "https://videos.pexels.com/video-files/27684480/12204362_1080_1920_60fps.mp4")!), replay: true)
]

//URL(string: "https://videos.pexels.com/video-files/8468212/8468212-hd_1080_1920_30fps.mp4")!,
//URL(string: "https://videos.pexels.com/video-files/9046240/9046240-uhd_1440_2560_24fps.mp4")!,
//URL(string: "https://videos.pexels.com/video-files/9969035/9969035-hd_1080_1920_25fps.mp4")!
