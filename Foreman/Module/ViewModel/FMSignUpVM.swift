//
//  FMSignUpVM.swift
//  Foreman
//
//  Created by Aarish on 23/08/22.
//

import Foundation
import UIKit
class FMSignUpVM {
    var signUpVC: FMSignUpVC?
    init(signUpVC: FMSignUpVC) {
        self.signUpVC = signUpVC
    }
    func printVM() {
        print("FMSignUpVM")
    }
    func setupView() {
        setupTableView()
//        signUpVC?.printBtn.backgroundColor = .red
    }
    private func setupTableView() {
        signUpVC?.signUpTV.delegate = signUpVC
        signUpVC?.signUpTV.dataSource = signUpVC
        signUpVC?.signUpTV.register(UINib(nibName: Constants.radioCell, bundle: .main), forCellReuseIdentifier: Constants.radioCell)
        signUpVC?.signUpTV.register(UINib(nibName: Constants.headingCell, bundle: .main), forCellReuseIdentifier: Constants.headingCell)
        signUpVC?.signUpTV.register(UINib(nibName: Constants.tfCell, bundle: .main), forCellReuseIdentifier: Constants.tfCell)
        signUpVC?.signUpTV.register(UINib(nibName: Constants.btnCell, bundle: .main), forCellReuseIdentifier: Constants.btnCell)
        signUpVC?.signUpTV.register(UINib(nibName: Constants.iDCell, bundle: .main), forCellReuseIdentifier: Constants.iDCell)
        signUpVC?.signUpTV.register(UINib(nibName: Constants.nameCell, bundle: .main), forCellReuseIdentifier: Constants.nameCell)
    }

    /// configuring Heading Cell
    /// - Parameter indexPath: selected indexPath
    /// - Returns: headingCell as UITableViewCell
    func configureHeadingCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = signUpVC?.signUpTV.dequeueReusableCell(withIdentifier: Constants.headingCell,
                                                    for: indexPath) as? HeadingCell ?? HeadingCell()
        return cell
    }

    /// configure NameCell
    /// - Parameter indexPath:  selected indexPath
    /// - Returns: NameTFCell
    func configureNameCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = signUpVC?.signUpTV.dequeueReusableCell(withIdentifier: Constants.nameCell, for: indexPath) as? NameTFCell ?? NameTFCell()
        cell.setup()
        cell.textFieldInput = { [self] val in
            if !Utilities.isValid(cell.firstTF.text!) || !Utilities.isValid(cell.secondTF.text!) {
                cell.errorTF.text = "Enter a vaild name"
            } else {
                cell.errorTF.text = ""
                signUpVC?.userData.firstName = val[0]!
                signUpVC?.userData.lastName = val[1]!
            }
        }
        return cell
    }
    /// configure EmailTFCell
    /// - Parameter indexPath: selected indexPath
    /// - Returns: EmailTFCell
    func configureTFCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = signUpVC?.signUpTV.dequeueReusableCell(withIdentifier: Constants.tfCell,
                                                for: indexPath) as? TextfieldCell ?? TextfieldCell()
        cell.setup()
        let small = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .small)
        cell.iconImageView.image = UIImage(systemName: Constants.imageName[indexPath.row], withConfiguration: small)
        cell.textFieldInput = { val in
            if indexPath.row == 2 {
                cell.inputTextfield.keyboardType = .emailAddress
                if !Utilities.isValidEmail(cell.inputTextfield.text!) {
                    cell.errorTF.text = "Enter a valid email"
                } else {
                    cell.errorTF.text = ""
                    self.signUpVC?.userData.email = val!
                }
            }
            if indexPath.row == 4 {
                cell.textFieldInput = { val in
                    self.signUpVC?.userData.address = val!
                }
                cell.inputTextfield.keyboardType = .default
            }
            if indexPath.row == 5 {
                cell.textFieldInput = { val in
                    self.signUpVC?.userData.age = val!
                }
                cell.inputTextfield.delegate = self.signUpVC
                cell.inputTextfield.keyboardType = .numberPad
            }
            if indexPath.row == 6 {
                cell.textFieldInput = { val in
                    self.signUpVC?.userData.experience = val!
                }
                cell.inputTextfield.delegate = self.signUpVC
                cell.inputTextfield.keyboardType = .numberPad
            }
        }
        
        cell.inputTextfield.placeholder = Constants.placeholder[indexPath.row]
        cell.headerLabel.text = Constants.placeholder[indexPath.row]
        return cell
    }
    /// configure RadioCell
    /// - Parameter indexPath: selected indexPath
    /// - Returns: RadioCell
    func configureRadioCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = signUpVC?.signUpTV.dequeueReusableCell(withIdentifier: Constants.radioCell,
                                                    for: indexPath) as? RadioBtnCell ?? RadioBtnCell()
        cell.callBackForOption = { val in
            if val == 1 {
                self.signUpVC?.userData.jobProfile = "Manager"
            } else {
                self.signUpVC?.userData.jobProfile = "Foreman"
            }
        }
        return cell
    }
   
    /// configure IDImageCell
    /// - Parameter indexPath: selected indexPath
    /// - Returns: IDImageCell
    func configureIDImageCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = signUpVC?.signUpTV.dequeueReusableCell(withIdentifier: Constants.iDCell, for: indexPath) as? IDImageCell ?? IDImageCell()
        cell.pickImage()
        return cell
    }
    /// configure submitCell
    /// - Parameter indexPath: selected indexPath
    /// - Returns: submitCell
    func configureSubmitBtnCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = signUpVC?.signUpTV.dequeueReusableCell(withIdentifier: Constants.btnCell, for: indexPath) as? ButtonCell ?? ButtonCell()
        cell.setup()
        cell.submitButton.addTarget(self.signUpVC, action: #selector(signUpVC?.submitAction), for: .touchUpInside)
        return cell
    }
}
