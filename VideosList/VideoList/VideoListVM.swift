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
    
    @Published var videos = [Video]()
    
    init(){
        load()
    }
    
    func load() {
        apiClient.fetchVideos().done { videosList in
            self.videos = videosList.videos
        }.catch { err in
            print(err)
        }
    }
}
