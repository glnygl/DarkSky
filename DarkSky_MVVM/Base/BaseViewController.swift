//
//  BaseViewController.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 11.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

protocol BaseViewControllerProtocol {
    associatedtype viewModelType
    var viewModel: viewModelType? { get set }
}

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
}

