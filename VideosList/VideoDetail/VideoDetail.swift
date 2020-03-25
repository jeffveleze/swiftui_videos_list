//
//  VideoDetail.swift
//  VideosList
//
//  Created by Jeff Velez on 23/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import AVFoundation
import SwiftUI

struct VideoDetail: View {
    let video: Video
    
    private let screenHeight: CGFloat = UIScreen.main.bounds.size.height

    var body: some View {
        ZStack {
            Color.white
            .navigationBarItems(trailing:
                HStack(spacing: 15) {
                    Text("Download video")
                        .foregroundColor(.blue)
                    Button(action: {
                        print("Hola")
                    }) {
                        Image(systemName: "square.and.arrow.down")
                    }
                }
            )
            
            VStack(spacing: 15) {
                PlayerContainerView(player: AVPlayer(url: video.link))
                    .cornerRadius(5)

                Text(video.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Text(video.description)
                    .font(.subheadline)
            }
            .offset(y: -60)
            .padding(15)
        }
    }
}
