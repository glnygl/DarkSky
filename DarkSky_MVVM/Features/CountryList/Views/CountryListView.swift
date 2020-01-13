//
//  CountryListView.swift
//  DarkSky_MVVM
//
//  Created by Gülenay Gül on 12.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

protocol CountryListDelegate {
    func citySelected(model: CountryListModel)
}

class CountryListView: BaseXibView, BaseViewProtocol {

    typealias viewModelType = CountryListViewModel
    typealias controllerType = CountryListViewController
    var viewModel: CountryListViewModel?
    var controller: CountryListViewController?
    
    @IBOutlet weak var closeIcon: UIImageView!
    @IBOutlet weak var countryTableView: UITableView!
    
    var delegate: CountryListDelegate?
        
    override func setupView() {
        closeIcon.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4))
        countryTableView.register(types: [.CountryListTableCell])
        countryTableView.delegate = self
    }
    
    func setViewModel() {
        observeBindingValue()
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        guard let vm = self.viewModel else { return }
        vm.dismiss()   
    }
    
    func observeBindingValue(){
        guard let vm = self.viewModel else { return }
        vm.countryData.bind(to: countryTableView.rx.items){(tableView, row, item) -> UITableViewCell in
            let indexPath = IndexPath(row: row, section: 0)
            if let cell = tableView.dequeue(type: CellType.CountryListTableCell.rawValue, indexPath: indexPath) as? CountryListTableCell{
                cell.assing(model: item)
                return cell
            }
            return UITableViewCell()
        }.disposed(by: vm.disposeBag)
    }
    
}

extension CountryListView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vm = self.viewModel else { return }
        let model = vm.countryData.value[indexPath.row]
        delegate?.citySelected(model: model)
    }
}
