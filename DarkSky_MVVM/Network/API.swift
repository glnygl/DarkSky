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
    
    static func GetWeather(location: LocationModel, success:@escaping (WeatherModel) -> Void, failure: @escaping (String) -> Void){
        if let urlRequest = Service.GetURLRequest(requestType: .Weather(location: location)){
            print(urlRequest)
            Service.AlamofireRequest(urlRequest: urlRequest, success: { (data) in
                data.decode(modelType: WeatherModel.self, success: { (model) in
                    if let model = model as? WeatherModel{
                        success(model)
                    }
                }) { (error) in
                     failure(error)
                }
            }) { (error) in
                 failure(error)
            }
        }
    }
    
    static func GetCountries(success:@escaping ([CountryListModel]) -> Void, failure: @escaping (String) -> Void){
        if let url = URL(string: Keys.countryURL){
            Service.AlamofireRequestUrl(url:url, success: { (data) in
                data.decode(modelType: [CountryListModel].self, success: { (model) in
                    if let model = model as? [CountryListModel]{
                        success(model)
                    }
                }) { (error) in
                  failure(error)
                }
            }, failure: { (error) in
                failure(error)
            })
        }
    }
}


