//
//  WeatherListViewModel.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 11.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation
import UIKit

class WeatherListViewModel: BaseViewModelProtocol{

    typealias viewType = WeatherListView
    var view: WeatherListView?
    typealias controllerType = WeatherListViewController
    var controller: WeatherListViewController?
    
    func setViewModel(controller: BaseViewController, viewLoadComplete: (() -> ())) {}
    

}
