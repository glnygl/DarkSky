//
//  UIColor+Extension.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 18.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hexString:String) {
        let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
    // MARK: Constant Colors
    
    class var BackgroundBlue: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "BackgroundBlue") ?? UIColor.clear
        } else {
            return UIColor(hexString: "#28556B")
        }
    }
    
    class var DarkBlue: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "DarkBlue") ?? UIColor.clear
        } else {
            return UIColor(hexString: "#163A4A")
        }
    }
    
    class var LightBlue: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "LightBlue") ?? UIColor.clear
        } else {
            return UIColor(hexString: "#628396")
        }
    }
    
    class var LightBlueColorLiteral: UIColor {
        return #colorLiteral(red: 0.3843137255, green: 0.5137254902, blue: 0.5882352941, alpha: 1)
        // Color Literal 
    }
    
}

