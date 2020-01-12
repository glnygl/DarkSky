//
//  WeatherListViewController.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 11.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

class WeatherListViewController: BaseViewController, BaseViewControllerProtocol{
    typealias viewModelType = WeatherListViewModel
    var viewModel: WeatherListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        API.GetWeather(location: Location(lat: 0, long: 0), success: { (model) in
//            print(model)
//        }) { (error) in
//            print(error)
//        }
    }
}
