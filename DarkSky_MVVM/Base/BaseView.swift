//
//  BaseView.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 12.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation
import UIKit

protocol BaseViewProtocol {
    associatedtype viewModelType
    var viewModel: viewModelType? { get set }    
}

class BaseView {

}
