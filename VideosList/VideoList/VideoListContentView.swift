//
//  VideoListContentView.swift
//  VideosList
//
//  Created by Jeff Velez on 25/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import SwiftUI

struct VideoListContentView: View {
    @ObservedObject var videoListVM: VideoListVM
    
    var body: some View {
        GeometryReader { geometry in
            // Add NavigationView Stack
            NavigationView {
                VideoListScrollView(
                    width: geometry.size.width, height:
                    geometry.size.height,
                    videoListVM: self.videoListVM
                )
                .navigationBarTitle(Text(self.videoListVM.makeTitleText()))
            }
        }
    }
}
