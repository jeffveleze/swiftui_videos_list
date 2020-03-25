//
//  PlayerView.swift
//  VideosList
//
//  Created by Jeff Velez on 24/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import AVFoundation
import SwiftUI

struct PlayerContainerView : View {
    private let player: AVPlayer
        init(player: AVPlayer) {
        self.player = player
    }
    
    var body: some View {
        ZStack(alignment: .center) {
             PlayerView(player: player)
                 .cornerRadius(5)
             PlayerControlsView(player: player)
         }
        .onDisappear {
            self.player.replaceCurrentItem(with: nil)
        }
    }
}

struct PlayerControlsView : View {
    @State var playerPaused = true
    
    let player: AVPlayer
    
    var body: some View {
        Button(action: {
            self.playerPaused.toggle()
            if self.playerPaused {
                self.player.pause()
            }
            else {
                self.player.play()
            }
        }) {
            Image(playerPaused ? "play" : "pause")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(Circle())
                .foregroundColor(.blue)

        }
        .colorMultiply(.green)
    }
}

struct PlayerView: UIViewRepresentable {
    let player: AVPlayer
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    
    func makeUIView(context: UIViewRepresentableContext<PlayerView>) -> UIView {
        return PlayerUIView(player: player)
    }
}

class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    
    init(player: AVPlayer) {
        super.init(frame: .zero)
        playerLayer.videoGravity = .resizeAspectFill
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
