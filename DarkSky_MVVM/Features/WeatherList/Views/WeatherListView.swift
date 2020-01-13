//
//  WeatherListView.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 11.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class WeatherListView: BaseXibView, BaseViewProtocol {
 
    typealias viewModelType = WeatherListViewModel
    typealias controllerType = WeatherListViewController
    var viewModel: WeatherListViewModel?
    var controller: WeatherListViewController?
    
    var countryName: String?
    var location: LocationModel?
    
    var dailyWeathers: [Weather]?
    
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var weatherListTableView: UITableView!
        
    override func setupView() {
        weatherListTableView.register(types: [.WeatherListTableCell, .WeatherDayListTableCell])
        weatherListTableView.delegate = self
        weatherListTableView.dataSource = self
    }
    
    func setViewModel() {
        observeBindingValue()
    }
    
    func observeBindingValue(){
        guard let vm = self.viewModel else { return }
        vm.weatherData.asObservable().subscribe { (event) in
            if let data = event.element, data.count > 0{
                if let daily = data.first?.daily, var dailyData = daily.data{
                    dailyData.remove(at: 0)
                    self.dailyWeathers = dailyData
                }
                self.emptyLabel.isHidden = true
                self.weatherListTableView.isHidden = false
                self.weatherListTableView.reloadData()
            }else{
                self.emptyLabel.isHidden = false
                self.weatherListTableView.isHidden = true
            }
        }.disposed(by: vm.disposeBag)
        
        
// MARK: Single Bind with RX
//        vm.weatherData.bind(to: weatherListTableView.rx.items){(tableView, row, item) -> UITableViewCell in
//            let indexPath = IndexPath(row: row, section: 0)
//            if let cell = tableView.dequeue(type: CellType.WeatherListTableCell.rawValue, indexPath: indexPath) as? WeatherListTableCell{
//                if let countryName = self.countryName{
//                    cell.assign(countryName: countryName, model: item)
//                }
//                return cell
//            }
//            return UITableViewCell()
//        }.disposed(by: vm.disposeBag)
    }
    
    @IBAction func openCountryList(_ sender: UIButton) {
        guard let vm = self.viewModel else { return }
        vm.openCountryList()        
    }
    
    @IBAction func refreshAction(_ sender: UIButton) {
        guard let vm = self.viewModel else { return }
        if let location = location{
            vm.fetchWeather(location: location)
        }
    }
    
}

extension WeatherListView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = self.viewModel else { return 0 }
        if vm.weatherData.value.count > 0 {
            return 1 + (self.dailyWeathers?.count ?? 0)
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let vm = self.viewModel else { return UITableViewCell()}
        if indexPath.row == 0 {
            if let cell = tableView.dequeue(type: CellType.WeatherListTableCell.rawValue, indexPath: indexPath) as? WeatherListTableCell{
                if let data = vm.weatherData.value.first, let countryName = self.countryName{
                    cell.assign(countryName: countryName, model: data)
                }
                return cell
            }
        }else{
            if let cell = tableView.dequeue(type: CellType.WeatherDayListTableCell.rawValue, indexPath: indexPath) as? WeatherDayListTableCell{
                if let data = self.dailyWeathers{
                    cell.assign(model: data[indexPath.row-1])
                }
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
}

extension WeatherListView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 148
        }else{
            return 56
        }
    }
}

extension WeatherListView: CountryListDelegate{
    func citySelected(model: CountryListModel) {
        guard let vm = self.viewModel else { return }
        if let lat = model.latlng?.first , let long = model.latlng?.last{
          let location = LocationModel(lat: lat, long: long)
            vm.fetchWeather(location: location)
            countryName = model.name
            self.location = location
        }
    }
}
