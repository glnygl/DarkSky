//
//  Service.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 11.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation
import Alamofire

class Service{
  
    static func AlamofireRequest(urlRequest: URLRequest, success:@escaping (Data) -> Void, failure: @escaping (String) -> Void){
        Alamofire.request(urlRequest).responseJSON { (response) -> Void in
            if response.result.isFailure {
                failure("error")
            } else {
                guard let data = response.data else { return failure("error") }
                success(data)
            }
        }
    }
    
    static func GetURLRequest(requestType: APIRouter) -> URLRequest?{
        do {
            return try requestType.asURLRequest()
        } catch {
           print("error")
           return nil
        }
    }
    
}

extension Data{
    
    func decode<T>(modelType: T.Type, success:@escaping (Any)-> Void) where T : Decodable {
        do {
            let model = try JSONDecoder().decode(modelType, from: self)
            success(model)
        } catch let error {
            print(error)
        }
    }
}

