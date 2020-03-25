//
//  VideoDetailVM.swift
//  VideosList
//
//  Created by Jeff Velez on 25/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import Foundation

protocol VideoDetailVMProtocol: AnyObject {
    func makeDownloadText() -> String
    func makeImageName() -> String
    func makeAlertTitle() -> String
    func makeAlertDescription() -> String
}

final class VideoDetailVM: ObservableObject {
    func makeDownloadText() -> String {
        return "Download video"
    }
    
    func makeImageName() -> String {
        return "square.and.arrow.down"
    }
    
    func makeAlertTitle() -> String {
        return "Hello :)"
    }
    
    func makeAlertDescription() -> String {
        return "Feature on Development"
    }
}
