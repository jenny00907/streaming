//
//  VideoPlayer.swift
//  StreamingKit
//
//  Created by Jenny Woorim Lee on 2021/10/21.
//

import AVFoundation
import AVKit

public class StreamingVideoPlayer {
    private let playerViewController = AVPlayerViewController()
    private let avPlayer = AVPlayer()
    
    private lazy var playerView: UIView = {
        let view = playerViewController.view!
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public init() {}
    
    public func add(to view: UIView) {
        view.addSubview(playerView)
        NSLayoutConstraint.activate([playerView.topAnchor.constraint(equalTo: view.topAnchor),
                                     playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    public func play(url: URL) {
        let asset = AVAsset(url: url)
        let playerItem = AVPlayerItem(asset: asset)
        avPlayer.replaceCurrentItem(with: playerItem)
        playerViewController.player = avPlayer
        playerViewController.player?.play()
    }
    
    public func pause() {
        avPlayer.pause()
    }
    
}
