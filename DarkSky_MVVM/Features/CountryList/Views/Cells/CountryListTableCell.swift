//
//  CountryListTableCell.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 12.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

class CountryListTableCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderWidth = 4
        containerView.layer.borderColor = Color.LightBlue.rawValue.getColor()?.cgColor
    }
    
    func assing(model: CountryListModel){
        countryLabel.text = model.name ?? "-"
        capitalLabel.text = model.capital ?? "-"
    }
    
}
