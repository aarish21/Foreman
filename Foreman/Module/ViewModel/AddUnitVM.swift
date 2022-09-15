//
//  AddUnitVM.swift
//  Foreman
//
//  Created by Aarish on 06/09/22.
//

import Foundation
import UIKit
class AddUnitVM {
    var addUnitVC: AddUnitVC?
    init(addUnitVC: AddUnitVC) {
        self.addUnitVC = addUnitVC
    }
    func setupTV() {
        addUnitVC?.addUnitTV.delegate = addUnitVC
        addUnitVC?.addUnitTV.dataSource = addUnitVC
        addUnitVC?.addUnitTV.register(UINib(nibName: Constants.tfCell, bundle: .main), forCellReuseIdentifier: Constants.tfCell)
        addUnitVC?.addUnitTV.register(UINib(nibName: Constants.greetingsCell, bundle: .main),
                                      forCellReuseIdentifier: Constants.greetingsCell)
        addUnitVC?.addUnitTV.register(UINib(nibName: Constants.datePickerCell, bundle: .main),
                                      forCellReuseIdentifier: Constants.datePickerCell)
        addUnitVC?.addUnitTV.register(UINib(nibName: Constants.headingCell, bundle: .main),
                                      forCellReuseIdentifier: Constants.headingCell)
    }
    
    func configureGreetingCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = addUnitVC?.addUnitTV.dequeueReusableCell(withIdentifier: Constants.greetingsCell,
                                                    for: indexPath) as? GreetingsCell ?? GreetingsCell()
        if addUnitVC?.isFromDashboardCell == true {
            cell.greetingLbl.text = "Add Employ Hours"
        } else {
            cell.greetingLbl.text = "Add Unit"
        }
        
        cell.greetingLbl.font = .systemFont(ofSize: 20, weight: .bold)
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        
        cell.locationLbl.text = formatter.string(from: currentDateTime)
        cell.locationLbl.textColor = .secondaryLabel
        cell.dateLbl.isHidden = true
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        return cell
    }
    func configureTFCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = addUnitVC?.addUnitTV.dequeueReusableCell(withIdentifier: Constants.tfCell,
                                                for: indexPath) as? TextfieldCell ?? TextfieldCell()
        cell.setup()
        let small = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .small)
        cell.iconImageView.image = UIImage(systemName: "briefcase.circle.fill", withConfiguration: small)
        cell.inputTextfield.placeholder = "Unit"
        cell.headerLabel.text = "Unit"
        cell.textFieldInput = { val in
            self.addUnitVC?.unitCellItem.unit = val!
        }
        if addUnitVC?.isFromDashboardCell == true {
//            cell.isUserInteractionEnabled = false
            cell.inputTextfield.text = addUnitVC?.unitCellItem.unit
        }
        cell.inputTextfield.delegate = self.addUnitVC
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        return cell
    }
    func configureDatePicker(indexPath: IndexPath) -> UITableViewCell {
        let cell = addUnitVC?.addUnitTV.dequeueReusableCell(withIdentifier: Constants.datePickerCell,
                                                for: indexPath) as? DatePickerCell ?? DatePickerCell()
        cell.setup(indexPath: indexPath, data: self.addUnitVC?.unitCellItem.employHours ?? [])

        return cell
    }
    func configureHeadingCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = addUnitVC?.addUnitTV.dequeueReusableCell(withIdentifier: Constants.headingCell,
                                                    for: indexPath) as? HeadingCell ?? HeadingCell()
        cell.headingLbl.text = "Employment hours"
        cell.headingLbl.font = .systemFont(ofSize: 17, weight: .semibold)
        return cell
    }
    
}
