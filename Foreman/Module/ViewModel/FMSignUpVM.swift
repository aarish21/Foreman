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
        signUpVC?.signUpTV.register(UINib(nibName: Constants.tfCell, bundle: .main), forCellReuseIdentifier: Constants.tfCell)
        signUpVC?.signUpTV.register(UINib(nibName: Constants.btnCell, bundle: .main), forCellReuseIdentifier: Constants.btnCell)
        signUpVC?.signUpTV.register(UINib(nibName: Constants.iDCell, bundle: .main), forCellReuseIdentifier: Constants.iDCell)
        signUpVC?.signUpTV.register(UINib(nibName: Constants.NameCell, bundle: .main), forCellReuseIdentifier: Constants.NameCell)
    }
}
