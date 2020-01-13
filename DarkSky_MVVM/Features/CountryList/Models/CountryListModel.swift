//
//  CountryListModel.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 12.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation

struct CountryListModel: Codable{
    var name: String?
    var region: String?
    var alpha2Code: String?
    var capital: String?
    var latlng: [Double]?
}
