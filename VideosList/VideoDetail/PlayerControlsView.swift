//
//  PlayerControlsView.swift
//  VideosList
//
//  Created by Jeff Velez on 25/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import AVFoundation
import SwiftUI

struct PlayerControlsView : View {
    // Keeps the state whether the player is paused or not
    @State var playerPaused = true
    
    let player: AVPlayer
    let playImageName = "play"
    let pauseImageName = "pause"
    
    var body: some View {
        
        // Play/Pause button handling
        Button(action: {
            self.playerPaused.toggle()
            self.playerPaused ? self.player.pause() : self.player.play()
        }) {
            
            // Whenever playerPaused changes its state the button image is updated
            Image(playerPaused ? playImageName : pauseImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(Circle())
                .foregroundColor(.blue)

        }
        .colorMultiply(.green)
    }
}
