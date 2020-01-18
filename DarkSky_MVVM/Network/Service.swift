//
//  Service.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 11.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

typealias ImageHandler = (UIImage?) -> Void

class Service{
  
    static func AlamofireRequest<T: Codable>(urlRequest: URLRequest, completion: @escaping (Result<T>) -> Void){
        Alamofire.request(urlRequest).responseJSON { (response) -> Void in
            if response.result.isFailure, let error = response.result.error {
                completion(.failure(error))
            } else {
                guard let data = response.data, let model: T = data.decode() else{
                    completion(.failure(ErrorType.ApiError))
                    return
                }
                completion(.success(model))
            }
        }
    }
    
    static func AlamofireRequestUrl<T: Codable>(url: URL, completion: @escaping (Result<T>) -> Void){
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isFailure, let error = response.result.error {
                completion(.failure(error))
            } else {
                guard let data = response.data, let model: T = data.decode() else{
                    completion(.failure(ErrorType.ApiError))
                    return
                }
                completion(.success(model))
            }
        }
    }
    
    static func GetURLRequest(requestType: APIRouter) -> URLRequest?{
        return try? requestType.asURLRequest()
    }
    
    static func AlamofireImageRequest(url: String, completion: @escaping ImageHandler){
        Alamofire.request(url).responseImage { response in
            completion(response.result.value)
        }
    }
    
}

extension Data{
    
    func decode<T: Codable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}

