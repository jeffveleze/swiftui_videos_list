//
//  VideoListVM.swift
//  VideosList
//
//  Created by Jeff Velez on 23/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import Foundation
import UIKit

class VideoListVM: ObservableObject {
    let apiClient: APIClient = APIClient()
    let videosKey = "videos_key"
    
    @Published var videos = [Video]()
    
    init(){
        load()
    }
    
    func load() {
        apiClient.fetchVideos().done { videosList in
            self.videos = videosList.videos
            self.save(videosList: videosList)
        }.catch { err in
            self.loadLocally()
        }
    }
}

private extension VideoListVM {
    func save(videosList: Videos) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(videosList) {
            UserDefaults.standard.set(encoded, forKey: videosKey)
        }
    }
    
    func loadLocally() {
        if let savedVideosList = UserDefaults.standard.object(forKey: videosKey) as? Data {
            let decoder = JSONDecoder()
            if let loadedVideosList = try? decoder.decode(Videos.self, from: savedVideosList) {
                self.videos = loadedVideosList.videos
            }
        }
    }
}
