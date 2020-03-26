//
//  VideoListScrollView.swift
//  VideosList
//
//  Created by Jeff Velez on 25/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import SwiftUI

// This interface is needed to create a UIKit view which is contained by a SwiftUI View
struct VideoListScrollView : UIViewRepresentable {
    var width : CGFloat
    var height : CGFloat
    
    let videoListVM: VideoListVM
    
    func makeCoordinator() -> RefreshCoordinator {
        RefreshCoordinator(self, videoListVM: videoListVM)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        // Create a scrollview
        let control = UIScrollView()
        
        // Create refresh control and add it to the scrollview, also add listener function for gesture
        control.refreshControl = UIRefreshControl()
        control.refreshControl?.addTarget(
            context.coordinator,
            action: #selector(RefreshCoordinator.handleRefreshControl), for: .valueChanged)
        
        // Add VideoList SwiftUI View as the rootView
        let childView = UIHostingController(rootView: VideoList(videoListVM: videoListVM))
        childView.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        // Add hosting view to the scrollview
        control.addSubview(childView.view)
        return control
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {}
}
