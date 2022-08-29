//
//  ButtonVC.swift
//  Foreman
//
//  Created by Aarish on 23/08/22.
//

import Foundation
import UIKit
class ButtonCell: UITableViewCell {
    @IBOutlet var submitButton: UIButton!
    func setup() {
        submitButton.layer.cornerRadius = 15
    }
}
