//
//  CountryListViewModel.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 12.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift
import SVProgressHUD

class CountryListViewModel: BaseViewModelProtocol{
    typealias viewType = CountryListView
    var view: CountryListView?
    typealias controllerType = CountryListViewController
    var controller: CountryListViewController?
    
    var countryData = BehaviorRelay<[CountryListModel]>(value: [])
    let disposeBag = DisposeBag()
    
    func setViewModel(controller: BaseViewController, viewLoadComplete: (() -> ())) {
        guard let controller = controller as? CountryListViewController else { return }
        self.controller = controller
        self.view = controller.view as? CountryListView
        self.controller?.view = controller.view as? CountryListView
        self.view?.viewModel = self
        self.view?.controller = controller
        self.view?.setViewModel()
        viewLoadComplete()
    }
    
    func fetchCountries(){
        SVProgressHUD.show()
        API.GetCountries(success: { (model) in
            SVProgressHUD.dismiss()
            self.countryData.accept(model)
        }) { (error) in
            SVProgressHUD.dismiss()
            self.showAlert(title: "DarkSky", message: "An error occured", buttonTitle: "Ok")
        }
    }
    
    func dismiss(){
        guard let controller = controller else { return }
        controller.dismiss(animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String, buttonTitle: String){
        guard let controller = controller else { return }
        controller.showAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
}
