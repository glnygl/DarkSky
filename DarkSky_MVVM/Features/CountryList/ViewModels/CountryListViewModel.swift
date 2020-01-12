//
//  CountryListViewModel.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 12.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation

class CountryListViewModel: BaseViewModelProtocol{
    typealias viewType = CountryListView
    var view: CountryListView?
    typealias controllerType = CountryListViewController
    var controller: CountryListViewController?
    
    func setViewModel(controller: BaseViewController, viewLoadComplete: (() -> ())) {
        guard let controller = controller as? CountryListViewController else { return }
        self.controller = controller
        self.view = controller.view as? CountryListView
        self.controller?.view = controller.view as? CountryListView
        self.view?.viewModel = self
        viewLoadComplete()
    }
    
}
