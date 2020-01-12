//
//  BaseViewModel.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 12.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation
import UIKit

protocol BaseViewModelProtocol {
    associatedtype viewType
    associatedtype controllerType
    var view: viewType? { get set }
    var controller : controllerType? { get set }
    func setViewModel(controller: BaseViewController, viewLoadComplete: (() -> ()))
}
