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
    
    @IBOutlet weak var weatherListTableView: UITableView!
    
    override func setupView() {
        weatherListTableView.register(types: [.WeatherListTableCell])
        weatherListTableView.delegate = self
    }
    
    func setViewModel() {
        observeBindingValue()
    }
    
    func observeBindingValue(){
        guard let vm = self.viewModel else { return }
        vm.weatherData.bind(to: weatherListTableView.rx.items){(tableView, row, item) -> UITableViewCell in
            let indexPath = IndexPath(row: row, section: 0)
            if let cell = tableView.dequeue(type: CellType.WeatherListTableCell.rawValue, indexPath: indexPath) as? WeatherListTableCell{
                if let countryName = self.countryName{
                    cell.assign(countryName: countryName, model: item)
                }
                return cell
            }
            return UITableViewCell()
        }.disposed(by: vm.disposeBag)
    }
    
    @IBAction func openCountryList(_ sender: UIButton) {
        guard let vm = self.viewModel else { return }
        vm.openCountryList()        
    }
    
    @IBAction func refreshAction(_ sender: UIButton) {
    }
    
}

extension WeatherListView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
}

extension WeatherListView: CountryListDelegate{
    func citySelected(model: CountryListModel) {
        guard let vm = self.viewModel else { return }
        if let lat = model.latlng?.first , let long = model.latlng?.last{
          let location = LocationModel(lat: lat, long: long)
            vm.fetchWeather(location: location)
            countryName = model.name
        }
    }
}
