//
//  API.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 11.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation
import Alamofire

typealias WeatherModelHandler = (Result<WeatherModel>) -> Void
typealias CountryListModelHandler = (Result<[CountryListModel]>) -> Void

class API{
    
    static func GetWeather(location: LocationModel, completion: @escaping WeatherModelHandler){
        if let urlRequest = Service.GetURLRequest(requestType: .Weather(location: location)){
            print(urlRequest)
            Service.AlamofireRequest(urlRequest: urlRequest) { (result: Result<WeatherModel>) in
                switch result {
                case .success(let model):
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func GetCountries(completion: @escaping CountryListModelHandler){
        if let url = URL(string: Keys.countryURL){
            Service.AlamofireRequestUrl(url: url) { (result: Result<[CountryListModel]>) in
                switch result {
                case .success(let model):
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}


