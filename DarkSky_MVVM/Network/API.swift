//
//  API.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 11.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation
import Alamofire

class API{
    
    static func GetWeather(location: Location, success:@escaping (WeatherModel) -> Void, failure: @escaping (String) -> Void){
        if let urlRequest = Service.GetURLRequest(requestType: .Weather(location: location)){
            print(urlRequest)
            Service.AlamofireRequest(urlRequest: urlRequest, success: { (data) in
                print(data)
                data.decode(modelType: WeatherModel.self) { (model) in
                    let a = model
                    print(a)
                }
            }) { (error) in
                print(error)
            }
        }
    }
}


