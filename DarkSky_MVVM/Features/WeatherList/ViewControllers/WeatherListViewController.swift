//
//  WeatherListViewController.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 11.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

class WeatherListViewController: BaseViewController{
    var viewModel = WeatherListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setViewModel(controller: self, viewLoadComplete: { })
    }
}
