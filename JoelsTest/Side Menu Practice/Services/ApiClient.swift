//
//  ApiClient.swift
//  JoelsTest
//
//  Created by Jean Carlos Arnaud on 7/21/19.
//  Copyright © 2019 Joel Alcantara. All rights reserved.
//

import Foundation
import Alamofire
import Combine

struct APIRequest<T: Decodable> {
    var routing: ApiRoutes
    var decoder: JSONDecoder
    var whileLoading: () -> Void
    var whenLoaded: ([T]) -> Void
    var onError: (String) -> Void
}

struct ApiClient {
    static let services = ApiClient()
    static let interceptor: RequestInterceptor? = nil
    
    static func request<T:Decodable>(apiRequest: APIRequest<T>) {
        apiRequest.whileLoading()
        AF.request(apiRequest.routing, interceptor: interceptor)
            .responseJSON() { response in
            switch response.result {
            case .success:
                let statusCode = (response.response?.statusCode)!
                switch statusCode {
                case 200...209:
                    do {
                        let data = try apiRequest.decoder.decode([T].self, from: response.data!)
                        apiRequest.whenLoaded(data)
                    } catch {
                        apiRequest.onError("error")
                    }
                case 400..<451:
                    do {
                        if let response = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
                            apiRequest.onError(response["message"] as! String)
                        }
                    } catch {
                        apiRequest.onError("error")
                    }
                default:
                    apiRequest.onError("An api Error has happen")
                }
            case .failure:
                apiRequest.onError("error")
            }
        }
    }

}
