//
//  VideoList.swift
//  VideosList
//
//  Created by Jeff Velez on 23/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import SwiftUI

struct VideoList: View {
    @ObservedObject var videoListVM: VideoListVM
    
    var body: some View {
        List(videoListVM.videos) { video in
            // Push to VideoDetail View
            NavigationLink(destination: VideoDetail(video: video)) {
                VideoRow(video: video)
            }
        }
    }
}
