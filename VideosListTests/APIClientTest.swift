//
//  APIClientTest.swift
//  VideosListTests
//
//  Created by Jeff Velez on 25/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import XCTest
@testable import VideosList

class APIClientTests: XCTestCase {
    func testFetchVideos() {
        let apiClient = APIClient()
        
        let expectation = XCTestExpectation(description: "Downloaded videos data")
        
        apiClient.fetchVideos().done { videos in
            XCTAssertNotNil(videos, "No videos were downloaded.")
            XCTAssertNotEqual(videos.videos.count, 0, "No videos were downloaded.")

            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 15.0)
    }
}
