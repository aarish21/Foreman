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
    @IBOutlet weak var errorTF: UILabel!
    var textFieldInput: ((_ value: [String?]) -> Void)?
    func setup() {
        firstTF.delegate = self
        firstView.layer.borderWidth = 2
        firstView.layer.cornerRadius = 15
      
       
        firstView.layer.borderColor = UIColor(named: "myColor")?.cgColor
        
        secondTF.delegate = self
        secondView.layer.borderWidth = 2
        secondView.layer.cornerRadius = 15
        secondView.layer.borderColor = UIColor(named: "myColor")?.cgColor

    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.count ?? 0 > 0 {
            textFieldInput!([firstTF.text, secondTF.text])
        }
    }
}
