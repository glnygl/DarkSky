//
//  CountryListViewController.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 12.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

class CountryListViewController: BaseViewController, BaseViewControllerProtocol {
    typealias viewModelType = CountryListViewModel
    var viewModel: CountryListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
