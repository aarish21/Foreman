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
    @IBOutlet weak var printBtn: UIButton!

    var signUpVMobj: FMSignUpVM?
    var isImageSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.signUpVMobj = FMSignUpVM(signUpVC: self)
//        self.navigationItem.title = Constants.signUpTitle
        signUpVMobj?.setupView()
    }

    @IBAction func printBtnAction(_ sender: Any) {
        signUpVMobj?.printVM()
    }

    func didSelectImage(with isSelect: Bool) {
        self.isImageSelected  = isSelect
        print(isImageSelected, "dsada", isSelect)
    }
}

extension FMSignUpVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.NameCell, for: indexPath) as? NameTFCell
            cell?.setup()
            return cell!
        }
        if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.btnCell, for: indexPath) as? ButtonCell
            cell?.setup()
            return cell!
        } else if  indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.iDCell, for: indexPath) as? IDImageCell
            cell?.delegate = self
            cell?.isImageSelected = { value in
                self.isImageSelected = value
                self.signUpTV.reloadData()
            }
            if isImageSelected {
                cell?.idImage.isHidden = false
            } else {
                cell?.idImage.isHidden = true
            }
            cell?.pickImage()
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
        if indexPath.row == 4 {
            if isImageSelected {
                return 150
            } else {
               return 60
            }
        }
        if indexPath.row == 5 {
            return 60
        }
        return 110
    }
}
