//
//  RefreshCoordinator.swift
//  VideosList
//
//  Created by Jeff Velez on 25/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import SwiftUI

// This class acts a delegate of scrollview to handle pull down to refresh gesture
class RefreshCoordinator: NSObject {
    var control: VideoListScrollView
    var videoListVM: VideoListVM
    
    init(_ control: VideoListScrollView, videoListVM: VideoListVM) {
        self.control = control
        self.videoListVM = videoListVM
    }

    @objc func handleRefreshControl(sender: UIRefreshControl) {
        // Reload videos list
        videoListVM.loadVideos()
        
        // Finish and hide refresh control
        sender.endRefreshing()
    }
}
