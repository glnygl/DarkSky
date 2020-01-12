//
//  Constants.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 11.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation
import UIKit

enum IconType: String{
    case ClearDay = "clear-day"
    case ClearNight = "clear-night"
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Wind = "wind"
    case Fog = "fog"
    case Cloudy = "cloudy"
    case PartlyCloudyDay = "partly-cloudy-day"
    case PartlyCloudyNight = "partly-cloudy-night"
    
    var image : UIImage? {
        switch self {
        case .ClearDay:
            return nil
        case .ClearNight:
            return nil
        case .Rain:
            return nil
        case .Snow:
            return nil
        case .Sleet:
            return nil
        case .Wind:
            return nil
        case .Fog:
            return nil
        case .Cloudy:
            return nil
        case .PartlyCloudyDay:
            return nil
        case .PartlyCloudyNight:
            return nil
        }
    }
}

