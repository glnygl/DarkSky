//
//  WeatherListModel.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 11.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation

struct Location{
    var lat: Int
    var long: Int
}

struct WeatherModel: Codable{
    var timezone: String?
    var currently: Weather?
    var daily: DailyWeather?
}

struct Weather: Codable{
    var time: Double?
    var summary: String?
    var icon: String?
    var temperature: Double?
}

struct DailyWeather: Codable{
    var summary: String?
    var icon: String?
    var data: [Weather]?
}
