//
//  NameTextfieldCell.swift
//  Foreman
//
//  Created by Aarish on 25/08/22.
//

import Foundation
import UIKit
class NameTFCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var firstTF: UITextField!
    @IBOutlet weak var secondTF: UITextField!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    var textFieldInput: ((_ value: [String?]) -> Void)?
    func setup() {
        firstView.layer.borderWidth = 2
        firstView.layer.cornerRadius = 15
//        firstTF.setLeftPaddingPoints(10)
        firstTF.delegate = self
        secondTF.delegate = self
        firstView.layer.borderColor = .init(red: 233/255, green: 236/255, blue: 242/255, alpha: 1)
        secondView.layer.borderWidth = 2
        secondView.layer.cornerRadius = 15
//        secondTF.setLeftPaddingPoints(20)
        secondView.layer.borderColor = .init(red: 233/255, green: 236/255, blue: 242/255, alpha: 1)

    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.count ?? 0 > 0 {
            textFieldInput!([firstTF.text, secondTF.text])
        }
    }
}
