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
    @ObservedObject var videoDetailVM = VideoDetailVM()
    
    // Keeps the state whether alert is being displayed or not
    @State private var showAlert = false

    let video: Video
    
    var body: some View {
        ZStack {
            
            // Add navigation text and download button
            Text("").navigationBarItems(trailing:
                HStack(spacing: 15) {
                    Text(videoDetailVM.makeDownloadText())
                        .foregroundColor(.blue)
                    Button(action: {
                        self.showAlert = true
                    }) {
                        Image(systemName: videoDetailVM.makeImageName())
                    }
                }
            )
            
            // Add PlayerContainerView which contains PlayerView and Controls, video name and video description texts
            VStack(spacing: 15) {
                PlayerContainerView(video: video)
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
            
        // Define alert to be presented when showAlert state changes
        }.alert(isPresented: $showAlert) { () -> Alert in
            Alert(title: Text(videoDetailVM.makeAlertTitle()),
                  message: Text(videoDetailVM.makeAlertDescription()),
                  dismissButton: .cancel()
            )
        }
        
    }
}
