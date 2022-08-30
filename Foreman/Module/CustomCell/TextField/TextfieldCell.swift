//
//  textfieldVC.swift
//  Foreman
//
//  Created by Aarish on 23/08/22.
//

import Foundation
import UIKit

class TextfieldCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var inputTextfield: UITextField!

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    var textFieldInput: ((_ value: String?) -> Void)?
    func setup() {
        inputTextfield.delegate = self
        outerView.layer.borderWidth = 2
        outerView.layer.cornerRadius = 15
        outerView.layer.borderColor = .init(red: 233/255, green: 236/255, blue: 242/255, alpha: 1)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldInput!(inputTextfield.text)
    }
}
