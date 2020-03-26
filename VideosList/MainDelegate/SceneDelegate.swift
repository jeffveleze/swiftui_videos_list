//
//  SceneDelegate.swift
//  VideosList
//
//  Created by Jeff Velez on 23/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    lazy var apiClient: APIClientProtocol = self.makeAPIClient()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let videoListVM = VideoListVM(apiClient: apiClient)
//        let videoList = VideoList(videoListVM: videoListVM)
        let videoList = VideoListContentView(videoListVM: videoListVM)
        
        if let windowScene = scene as? UIWindowScene {
             let window = UIWindow(windowScene: windowScene)
             window.rootViewController = UIHostingController(rootView: videoList)
             self.window = window
             window.makeKeyAndVisible()
         }
    }
    
    func makeAPIClient() -> APIClientProtocol {
        return APIClient()
    }
}
