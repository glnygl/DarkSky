//
//  WeatherDayListTableCell.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 13.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

class WeatherDayListTableCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderWidth = 4
        containerView.layer.borderColor = Color.LightBlue.rawValue.getColor()?.cgColor
    }
    
    func assign(model: Weather){
        if let time = model.time{
            let date = Date(timeIntervalSince1970: time)
            if let dateString = date.toString(format: "EEEE"){
                dayLabel.text = dateString
            }
        }
        
        if let icon = model.icon{
            weatherIcon.image = icon.getIcon()
        }
                
        if let tempature = model.temperatureLow{
          temperatureLabel.text = "\(Int(tempature)) °C"
        }else{
          temperatureLabel.text = "~°C"
        }
    }
    
}
