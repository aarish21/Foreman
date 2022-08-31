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
            signUpVC?.userData.firstName = val[0]!
            signUpVC?.userData.lastName = val[1]!
        }
        return cell
    }
    /// configure EmailTFCell
    /// - Parameter indexPath: selected indexPath
    /// - Returns: EmailTFCell
    func configureEmailTFCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = signUpVC?.signUpTV.dequeueReusableCell(withIdentifier: Constants.tfCell,
                                                for: indexPath) as? TextfieldCell ?? TextfieldCell()
        cell.setup()
        let small = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .small)
        cell.iconImageView.image = UIImage(systemName: Constants.imageName[indexPath.row], withConfiguration: small)
        cell.textFieldInput = { val in
            self.signUpVC?.userData.email = val!
        }
        cell.inputTextfield.keyboardType = .emailAddress
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
    /// configure AddressCell
    /// - Parameter indexPath: selected indexPath
    /// - Returns: AddressCell
    func configureAddressCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = signUpVC?.signUpTV.dequeueReusableCell(withIdentifier: Constants.tfCell,
                                                    for: indexPath) as? TextfieldCell ?? TextfieldCell()
        cell.setup()
        let small = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .small)
        cell.iconImageView.image = UIImage(systemName: Constants.imageName[indexPath.row], withConfiguration: small)
        cell.textFieldInput = { val in
            self.signUpVC?.userData.address = val!
        }
        cell.inputTextfield.keyboardType = .default
        cell.inputTextfield.placeholder = Constants.placeholder[indexPath.row]
        cell.headerLabel.text = Constants.placeholder[indexPath.row]
        return cell
    }
    /// configure AgeCell
    /// - Parameter indexPath: selected indexPath
    /// - Returns: AgeCell
    func configureAgeCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = signUpVC?.signUpTV.dequeueReusableCell(withIdentifier: Constants.tfCell,
                                                    for: indexPath) as? TextfieldCell ?? TextfieldCell()
        cell.setup()
        let small = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .small)
        cell.iconImageView.image = UIImage(systemName: Constants.imageName[indexPath.row], withConfiguration: small)
        cell.textFieldInput = { val in
            self.signUpVC?.userData.age = val!
        }
        cell.inputTextfield.keyboardType = .numberPad
        cell.inputTextfield.placeholder = Constants.placeholder[indexPath.row]
        cell.headerLabel.text = Constants.placeholder[indexPath.row]
        return cell
    }
    /// configure experienceCell
    /// - Parameter indexPath: selected indexPath
    /// - Returns: experienceCell
    func configureExpCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = signUpVC?.signUpTV.dequeueReusableCell(withIdentifier: Constants.tfCell,
                                                    for: indexPath) as? TextfieldCell ?? TextfieldCell()
        cell.setup()
        let small = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .small)
        cell.iconImageView.image = UIImage(systemName: Constants.imageName[indexPath.row], withConfiguration: small)
        cell.textFieldInput = { val in
            self.signUpVC?.userData.experience = val!
        }
        cell.inputTextfield.keyboardType = .numberPad
        cell.inputTextfield.placeholder = Constants.placeholder[indexPath.row]
        cell.headerLabel.text = Constants.placeholder[indexPath.row]
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
        cell.submitButton.addTarget(self, action: #selector(signUpVC?.submitAction), for: .touchUpInside)
        return cell
    }
}
