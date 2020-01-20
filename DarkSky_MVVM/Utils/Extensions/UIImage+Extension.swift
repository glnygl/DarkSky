//
//  UIImage+Extension.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 20.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

extension UIImage {
    
    convenience init?(assetName : String) {
        self.init(named: assetName)
    }
    
}
