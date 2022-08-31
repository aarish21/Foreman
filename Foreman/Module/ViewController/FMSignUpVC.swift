//
//  FMSignUpVC.swift
//  Foreman
//
//  Created by Aarish on 23/08/22.
//

import Foundation
import UIKit

class FMSignUpVC: UIViewController {

    @IBOutlet var signUpTV: UITableView!
    var userData = SignUpModel()
    var signUpVMobj: FMSignUpVM?
    var isImageSelected = false
    var firstName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signUpVMobj = FMSignUpVM(signUpVC: self)
        self.navigationItem.title = Constants.signUpTitle
        signUpVMobj?.setupView()
    }

    func didSelectImage(with isSelect: Bool) {
        self.isImageSelected  = isSelect
        print(isImageSelected, "dsada", isSelect)
    }

    @objc func submitAction() {
        userData.date = Int(Date().timeIntervalSince1970)
        FirestoreDB.signUpUser(signUpData: userData) { err in
            if err != nil {
                print(err?.localizedDescription as Any)
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
        } else if indexPath.row == 2 {
            return signUpVMobj?.configureEmailTFCell(indexPath: indexPath) ?? UITableViewCell()
        } else if indexPath.row == 3 {
            return signUpVMobj?.configureRadioCell(indexPath: indexPath) ?? UITableViewCell()
        } else if indexPath.row == 4 {
            return signUpVMobj?.configureAddressCell(indexPath: indexPath) ?? UITableViewCell()
        } else if indexPath.row == 5 {
            return signUpVMobj?.configureAgeCell(indexPath: indexPath) ?? UITableViewCell()
        } else if indexPath.row == 6 {
            return signUpVMobj?.configureExpCell(indexPath: indexPath) ?? UITableViewCell()
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
            return 60
        }
        if indexPath.row == 3 {
            return 125
        }
        return 100
    }
}
