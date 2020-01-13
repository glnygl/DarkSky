//
//  UIViewController+Extensions.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 12.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: buttonTitle, style: .default))
        present(alertController, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String, buttonTitles: [String], leftAction: ((UIAlertAction) -> Void)? = nil, rightAction: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: buttonTitles[0], style: .default, handler: leftAction))
        alertController.addAction(UIAlertAction(title: buttonTitles[1], style: .default, handler: rightAction))
        present(alertController, animated: true, completion: nil)
    }
}
