//
//  APIRouter.swift
//  VideosList
//
//  Created by Jeff Velez on 23/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import Alamofire
import Foundation

struct APIRouter {
    var url: URL?

    init(urlString: String) {
      self.url = URL(string: urlString)
    }
}

extension APIRouter: URLConvertible {
    func asURL() -> URL {
        return url!
    }
}

enum APIRouteError: LocalizedError {
    case invalidURL

    var errorDescription: String? {
        switch self {
        case .invalidURL:
          return "URL isn't valid"
        }
    }
}

enum APIRoute {
    case videos
    
    func path() -> String {
        switch self {
           case .videos:
             return "https://iphonephotographyschool.com/test-api/videos"
        }
    }
}
