//
//  VideoListVM.swift
//  VideosList
//
//  Created by Jeff Velez on 23/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import Foundation

protocol VideoListVMProtocol: AnyObject {
    var videos: [Video] { get }

    func loadVideos()
    func makeTitleText() -> String
    func save(videosList: Videos)
    func loadVideosLocally()
}

final class VideoListVM: ObservableObject, VideoListVMProtocol {
    let apiClient: APIClientProtocol
    let videosKey = "videos_key"

    @Published var videos = [Video]()
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
        loadVideos()
    }
    
    // Fetch videos from server
    func loadVideos() {
        apiClient.fetchVideos().done { videosList in
            self.videos = videosList.videos
            self.save(videosList: videosList)
        }.catch { err in
            self.loadVideosLocally()
        }
    }
    
    func makeTitleText() -> String {
        return "Videos"
    }
    
    // Save videos locally
    func save(videosList: Videos) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(videosList) {
            UserDefaults.standard.set(encoded, forKey: videosKey)
        }
    }
    
    // Fetch videos locally
    func loadVideosLocally() {
        if let savedVideosList = UserDefaults.standard.object(forKey: videosKey) as? Data {
            let decoder = JSONDecoder()
            if let loadedVideosList = try? decoder.decode(Videos.self, from: savedVideosList) {
                self.videos = loadedVideosList.videos
            }
        }
    }
}
