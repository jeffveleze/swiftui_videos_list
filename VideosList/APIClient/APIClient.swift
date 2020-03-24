//
//  APIClient.swift
//  VideosList
//
//  Created by Jeff Velez on 23/03/20.
//  Copyright © 2020 Jeff Velez. All rights reserved.
//

import Alamofire
import Foundation
import PromiseKit

class APIClient {
    @discardableResult
    private func performRequest<T:Decodable>(route: APIRouter) -> Promise<T> {
        return Promise { seal in
            AF.request(route.asURL()).responseDecodable(completionHandler: { (response: DataResponse<T, AFError>) in
                switch response.result {
                case let .success(val):
                    seal.fulfill(val)
                case let .failure(err):
                    seal.reject(err)
                }
            })
        }
    }
    
    func fetchVideos() -> Promise<Videos> {
        let route = APIRouter(urlString: APIRoute.videos.path())
        return performRequest(route: route)
    }
}
