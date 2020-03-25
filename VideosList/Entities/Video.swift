//
//  Video.swift
//  VideosList
//
//  Created by Jeff Velez on 23/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import SwiftUI

struct Videos: Codable {
    var videos: [Video]
    
    // Key from API response
    enum CodingKeys: String, CodingKey {
        case videos = "videos"
    }
}

struct Video: Codable, Identifiable {
    var id: Int
    var name: String
    var thumbnail: URL
    var description: String
    var link: URL
    
    // Keys from API response
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case thumbnail = "thumbnail"
        case description = "description"
        case link = "video_link"
    }
}
