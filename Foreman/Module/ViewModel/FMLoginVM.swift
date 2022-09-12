//
//  FMLoginVM.swift
//  Foreman
//
//  Created by Aarish on 31/08/22.
//

import Foundation
import UIKit

class FMLoginVM {
    var loginVC: FMLoginVC?
    init(loginVC: FMLoginVC) {
        self.loginVC = loginVC
    }
    
    func setupTableView() {
        loginVC?.loginTV.delegate = loginVC
        loginVC?.loginTV.dataSource = loginVC
        loginVC?.loginTV.register(UINib(nibName: Constants.radioCell, bundle: .main), forCellReuseIdentifier: Constants.radioCell)
        loginVC?.loginTV.register(UINib(nibName: Constants.headingCell, bundle: .main), forCellReuseIdentifier: Constants.headingCell)
        loginVC?.loginTV.register(UINib(nibName: Constants.tfCell, bundle: .main), forCellReuseIdentifier: Constants.tfCell)
        loginVC?.loginTV.register(UINib(nibName: Constants.btnCell, bundle: .main), forCellReuseIdentifier: Constants.btnCell)
    }
    func configureHeadingCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = loginVC?.loginTV.dequeueReusableCell(withIdentifier: Constants.headingCell,
                                                    for: indexPath) as? HeadingCell ?? HeadingCell()
        cell.headingLbl.text = "Login"
        return cell
    }
    
    func configureTFCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = loginVC?.loginTV.dequeueReusableCell(withIdentifier: Constants.tfCell,
                                                for: indexPath) as? TextfieldCell ?? TextfieldCell()
        cell.setup()
        let small = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .small)
        cell.iconImageView.image = UIImage(systemName: "envelope.circle", withConfiguration: small)
        if indexPath.row == 1 {
            cell.textFieldInput = { val in
                self.loginVC?.foreman.email = val!
            }
            cell.inputTextfield.keyboardType = .emailAddress
            cell.inputTextfield.placeholder = "Email"
            cell.headerLabel.text = "Email*"
        } else {
            cell.textFieldInput = { val in
                self.loginVC?.foreman.password = val!
            }
            
            cell.inputTextfield.keyboardType = .default
            cell.inputTextfield.isSecureTextEntry = true
            cell.inputTextfield.placeholder = "password"
            cell.headerLabel.text = "Password*"
        }
        return cell
    }
    
    func configureSubmitBtnCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = loginVC?.loginTV.dequeueReusableCell(withIdentifier: Constants.btnCell, for: indexPath) as? ButtonCell ?? ButtonCell()
        cell.setup()
        cell.submitButton.titleLabel?.text = "Login"
        cell.submitButton.addTarget(loginVC, action: #selector(loginVC?.submitAction), for: .touchUpInside)
        return cell
    }
    
}
