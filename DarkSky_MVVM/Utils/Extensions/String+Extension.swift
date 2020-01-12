//
//  String+Extension.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 12.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import Foundation
import UIKit

extension String{

    func getIcon() -> UIImage?{
        if let image = UIImage(named: self){
            return image
        }
        return nil
    }
    
    
}
