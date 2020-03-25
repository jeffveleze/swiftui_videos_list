//
//  VideoRow.swift
//  VideosList
//
//  Created by Jeff Velez on 23/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import SwiftUI
import URLImage

struct VideoRow: View {
    let video: Video

    var body: some View {
        HStack {
            URLImage(video.thumbnail) { proxy in
            proxy.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .cornerRadius(5)
            }
            .frame(width: 60, height: 60)
            
            Text(video.name)
                .font(.subheadline)
        }
    }
}
