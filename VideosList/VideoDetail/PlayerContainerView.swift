//
//  PlayerContainerView.swift
//  VideosList
//
//  Created by Jeff Velez on 25/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import AVFoundation
import SwiftUI


struct PlayerContainerView : View {
    private let player: AVPlayer
    private let video: Video
    
    init(video: Video) {
        self.video = video
        self.player = AVPlayer()
    }
    
    // This view contains the player and also the controls to handle the player
    var body: some View {
        ZStack(alignment: .center) {
            PlayerView(player: player, video: video)
                 .cornerRadius(5)
            PlayerControlsView(player: player)
         }
            
        // Clean player item reference when leaving the view dissapears
        .onDisappear {
            self.player.replaceCurrentItem(with: nil)
        }
    }
}
