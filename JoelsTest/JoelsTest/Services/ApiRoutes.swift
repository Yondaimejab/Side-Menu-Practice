//
//  ApiRoutes.swift
//  JoelsTest
//
//  Created by Jean Carlos Arnaud on 7/21/19.
//  Copyright © 2019 Joel Alcantara. All rights reserved.
//

import Foundation
import Alamofire

enum baseRouteConstants: String {
    case baseUrl = "https://randomuser.me/api/"
}


enum ApiRoutes: URLRequestConvertible{
    case getUser
    
    private var endPoint:String {
    switch self {
        case .getUser:
            return ""
        default:
            return ""
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getUser:
            return .get
        default:
            return .get
        }
    }
    
    private var parameters: Parameters {
        switch self{
            case .getUser:
                return [:]
            default:
                return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try (baseRouteConstants.baseUrl.rawValue + endPoint).asURL()
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request = try URLEncoding.methodDependent.encode(request,with: parameters)
        return request
    }
    
    
}
