//
//  FMSignUpVC.swift
//  Foreman
//
//  Created by Aarish on 23/08/22.
//

import Foundation
import UIKit

class FMSignUpVC: UIViewController, IDImageCellDelegate {

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
       
    }
}

extension FMSignUpVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.headingCell, for: indexPath) as? HeadingCell
            return cell!
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.nameCell, for: indexPath) as? NameTFCell
            cell?.setup()
            cell?.textFieldInput = { val in
                print(val)
                self.firstName = val[0]!
            }
            return cell!
        } else if  indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.iDCell, for: indexPath) as? IDImageCell
            cell?.delegate = self
            cell?.pickImage()
            return cell!
        } else if indexPath.row == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.btnCell, for: indexPath) as? ButtonCell
            cell?.setup()
            cell?.submitButton.addTarget(self, action: #selector(submitAction), for: .touchUpInside)
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tfCell, for: indexPath) as? TextfieldCell
            cell?.setup()
            let small = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .small)
            cell?.iconImageView.image = UIImage(systemName: Constants.imageName[indexPath.row], withConfiguration: small)
            cell?.inputTextfield.placeholder = Constants.placeholder[indexPath.row]
            cell?.headerLabel.text = Constants.placeholder[indexPath.row]
            return cell!
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 6 {
            return 120
        }
        if indexPath.row == 7 {
            return 60
        }
        if indexPath.row == 0 {
            return 60
        }
        return 100
    }
}
