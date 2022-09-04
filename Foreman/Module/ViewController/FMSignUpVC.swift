//
//  FMSignUpVC.swift
//  Foreman
//
//  Created by Aarish on 23/08/22.
//

import Foundation
import UIKit

class FMSignUpVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var signUpTV: UITableView!
    var userData = SignUpModel()
    var signUpVMobj: FMSignUpVM?
    var isImageSelected = false
    var firstName = ""
    var reusableAlert = ReusableAlert()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signUpVMobj = FMSignUpVM(signUpVC: self)
//        self.navigationItem.title = Constants.signUpTitle
        signUpVMobj?.setupView()
    }

    func didSelectImage(with isSelect: Bool) {
        self.isImageSelected  = isSelect
        print(isImageSelected, "dsada", isSelect)
    }

    @objc func submitAction() {
        if userData.firstName == "" || userData.lastName == "" {
            reusableAlert.presentAlertWithTitle(title: "Enter your name", message: "", options: "ok") {_ in}
        } else if !Utilities.isValidEmail(userData.email) {
//            alert for valid email
            reusableAlert.presentAlertWithTitle(title: "Enter a valid Email", message: "", options: "ok") {_ in}
        } else if userData.jobProfile == "" {
            reusableAlert.presentAlertWithTitle(title: "Select a Job profile", message: "", options: "ok") {_ in}
        } else if userData.address == "" {
            reusableAlert.presentAlertWithTitle(title: "Enter the address", message: "", options: "ok") {_ in}
        } else if userData.age == "" {
            reusableAlert.presentAlertWithTitle(title: "Enter your age", message: "", options: "ok") {_ in}
        } else if userData.experience == "" {
            reusableAlert.presentAlertWithTitle(title: "Enter your experience", message: "", options: "ok") {_ in}
        } else {
            userData.date = Int(Date().timeIntervalSince1970)
            FirestoreDB.signUpUser(signUpData: userData) { err in
                if err != nil {
                    print(err?.localizedDescription as Any)
                }
            }
        }
    }
}

extension FMSignUpVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return signUpVMobj?.configureHeadingCell(indexPath: indexPath) ?? UITableViewCell()
        } else if indexPath.row == 1 {
            return signUpVMobj?.configureNameCell(indexPath: indexPath) ?? UITableViewCell()
        } else if indexPath.row == 2 || indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6 {
            return signUpVMobj?.configureTFCell(indexPath: indexPath) ?? UITableViewCell()
        } else if indexPath.row == 3 {
            return signUpVMobj?.configureRadioCell(indexPath: indexPath) ?? UITableViewCell()
        } else if  indexPath.row == 7 {
            return signUpVMobj?.configureIDImageCell(indexPath: indexPath) ?? UITableViewCell()
        } else {
            return signUpVMobj?.configureSubmitBtnCell(indexPath: indexPath) ?? UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 7 {
            return 120
        }
        if indexPath.row == 8 {
            return 60
        }
        if indexPath.row == 0 {
            return 100
        }
        if indexPath.row == 3 {
            return 125
        }
        if indexPath.row == 1 {
            return 120
        }
        return 120
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn: "0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
}
