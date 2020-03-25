//
//  PlayerView.swift
//  VideosList
//
//  Created by Jeff Velez on 24/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import AVFoundation
import SwiftUI

// Interface required to link UIKit UIView with SwiftUI View
struct PlayerView: UIViewRepresentable {
    let player: AVPlayer
    let video: Video
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {}
    
    func makeUIView(context: UIViewRepresentableContext<PlayerView>) -> UIView {
        return PlayerUIView(player: player, video: video)
    }
}

class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private let video: Video
    private var urlAsset: AVURLAsset!
    
    init(player: AVPlayer, video: Video) {
        self.video = video
        super.init(frame: .zero)
        
        // Define player required elements
        let assetKeys = ["duration", "playable"]
        let urlAsset = AVURLAsset(url: video.link)
        let playerItem = AVPlayerItem(asset: urlAsset, automaticallyLoadedAssetKeys: assetKeys)
        player.replaceCurrentItem(with: playerItem)

        // Make the video scale to the player view size
        playerLayer.videoGravity = .resizeAspectFill
        
        // Add the player to layer and insert layer on player view layer
        playerLayer.player = player
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        playerLayer.frame = bounds
    }
}
