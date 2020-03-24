//
//  VideoRow.swift
//  VideosList
//
//  Created by Jeff Velez on 23/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import SwiftUI

struct VideoRow: View {
    var video: Video

    var body: some View {
        HStack {
            Text(video.name)
        }
    }
}
