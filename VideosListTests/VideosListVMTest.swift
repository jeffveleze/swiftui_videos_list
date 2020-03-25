//
//  VideosListVMTests.swift
//  VideosListVMTests
//
//  Created by Jeff Velez on 23/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import XCTest
@testable import VideosList

class VideosListVMTests: XCTestCase {
    func testLoadVideosLocally() {
        let apiClient = APIClient()
        let videosListViewModel = VideoListVM(apiClient: apiClient)
        
        videosListViewModel.loadVideosLocally()

        let waitExpectation = expectation(description: "Loading data locally")

        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            XCTAssertNotNil(videosListViewModel.videos.count, "No videos were loaded locally.")
            XCTAssertNotEqual(videosListViewModel.videos.count, 0, "No videos were loaded locally.")
            
            waitExpectation.fulfill()
        }

        waitForExpectations(timeout: 15)
    }
}
