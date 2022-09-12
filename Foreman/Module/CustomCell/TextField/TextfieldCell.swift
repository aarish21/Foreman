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

    @IBOutlet weak var errorTF: UILabel!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    var textFieldInput: ((_ value: String?) -> Void)?
    func setup() {
        inputTextfield.delegate = self
        outerView.layer.borderWidth = 2
        outerView.layer.cornerRadius = 15
        outerView.layer.borderColor = UIColor(named: "myColor")?.cgColor
        inputTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
   
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text?.count ?? 0 > 0 {
            if textFieldInput != nil {
                textFieldInput!(inputTextfield.text)
            }
        }
    }
    
}
