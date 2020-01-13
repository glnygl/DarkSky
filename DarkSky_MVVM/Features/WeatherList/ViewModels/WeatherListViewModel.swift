//
//  WeatherListViewModel.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 11.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation
import UIKit
import RxRelay
import RxSwift

class WeatherListViewModel: BaseViewModelProtocol{

    typealias viewType = WeatherListView
    var view: WeatherListView?
    typealias controllerType = WeatherListViewController
    var controller: WeatherListViewController?

    var weatherData = BehaviorRelay<[WeatherModel]>(value: [])
    let disposeBag = DisposeBag()
    
    
    func setViewModel(controller: BaseViewController, viewLoadComplete: (() -> ())) {
        guard let controller = controller as? WeatherListViewController else { return }
        self.controller = controller
        self.view = controller.view as? WeatherListView
        self.controller?.view = controller.view as? WeatherListView
        self.view?.viewModel = self
        self.view?.controller = controller
        self.view?.setViewModel()
        viewLoadComplete()
    }
    
    func fetchWeather(location: LocationModel){
        guard let controller = controller else { return }
        API.GetWeather(location: location, success: { (model) in
            self.weatherData.accept([model])
            controller.dismiss(animated: true, completion: nil)
        }) { (error) in
            print("error")
            controller.dismiss(animated: true, completion: nil)
        }
    }
    
    func openCountryList(){
        guard let controller = self.controller else { return }
        let countryListVC = CountryListViewController(nibName: ControllerType.CountryListViewController.rawValue, bundle: nil)
        if let countryView = countryListVC.view as? CountryListView, let weatherView = controller.view as? WeatherListView{
            countryView.delegate = weatherView
        }
        countryListVC.modalPresentationStyle = .fullScreen
        controller.navigationController?.present(countryListVC, animated: true)
    }
    

}
