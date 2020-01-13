//
//  WeatherListTableCell.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 12.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

class WeatherListTableCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var clockLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderWidth = 4
        containerView.layer.borderColor = Color.LightBlue.rawValue.getColor()?.cgColor
    }
    
    func assign(countryName: String, model: WeatherModel){
        if let location = model.timezone{
         let locationArray = location.split(separator: "/")
            if let city = locationArray.last{
              locationLabel.text = "\(countryName) / \(city)"
            }else{
             locationLabel.text = "\(countryName)"
            }
        }else{
         locationLabel.text = "\(countryName)"
        }
        
        if let tempature = model.currently?.temperature{
          temperatureLabel.text = "\(Int(tempature)) °C"
        }else{
          temperatureLabel.text = "~°C"
        }
        
        if let icon = model.currently?.icon{
            weatherIcon.image = icon.getIcon()
            weatherTypeLabel.text = getWeatherType(type: icon)
        }
        
        if let time = model.currently?.time{
            let date = Date(timeIntervalSince1970: time)
            if let dateString = date.toString(format: "d,MMM,EE,h:mm a"){
                let dateArray = dateString.split(separator: ",")
                if dateArray.count == 4{
                    numberLabel.text = String(dateArray[0])
                    monthLabel.text = String(dateArray[1])
                    dayLabel.text = String(dateArray[2])
                    clockLabel.text = String(dateArray[3])
                }
            }
        }
        
    }
    
    func getWeatherType(type: String) -> String{
        switch type {
        case IconType.ClearDay.rawValue:
            return "Clear"
        case IconType.ClearNight.rawValue:
            return "Clear"
        case IconType.Rain.rawValue:
            return "Rain"
        case IconType.Snow.rawValue:
            return "Snow"
        case IconType.Sleet.rawValue:
            return "Sleet"
        case IconType.Wind.rawValue:
            return "Wind"
        case IconType.Fog.rawValue:
            return "Fogy"
        case IconType.Cloudy.rawValue:
            return "Cloudy"
        case IconType.PartlyCloudyDay.rawValue:
            return "Partly Cloudy"
        case IconType.PartlyCloudyNight.rawValue:
            return "Partly Cloudy"
        default:
            return ""
        }
    }
    
}
