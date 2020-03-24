//
//  VideoDetail.swift
//  VideosList
//
//  Created by Jeff Velez on 23/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import SwiftUI

struct VideoDetail: View {
    let video: Video
    
    var body: some View {
        Text(video.description)
    }
}
