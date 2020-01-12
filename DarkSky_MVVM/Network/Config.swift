//
//  Config.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 11.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation
import Alamofire

struct Keys {
    static let baseURL = "https://api.darksky.net"
    static let key = "/14d662c5816cb1c9b35d98c8fa079eb4"
}

enum APIRouter: URLRequestConvertible {
    
    case Weather(location: Location)
    
    private var method: HTTPMethod {
        switch self {
        case .Weather:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .Weather:
            return "/forecast"
        }
    }
        
    private var query: String?{
        switch self {
        case .Weather(let location):
            return "/\(location.lat),\(location.long)"
        }
    }
    
    private var params: Parameters? {
        switch self {
        case .Weather:
            return nil
        }
    }
        
    
    func asURLRequest() throws -> URLRequest {
        let url = try Keys.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path + Keys.key + (query ?? "")))

        urlRequest.httpMethod = method.rawValue
        
        if let parameters = params {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}

