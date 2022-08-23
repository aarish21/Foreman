//
//  idImageVC.swift
//  Foreman
//
//  Created by Aarish on 23/08/22.
//

import Foundation
import UIKit
import SwiftUI

class IDImageCell: UITableViewCell, ImagePickerDelegate {
    @IBOutlet weak var pick: UIButton!
    @IBOutlet weak var idImage: UIImageView!
    var imagePicker: ImagePicker!
    func pickImage() {
        self.imagePicker = ImagePicker(presentationController: Constants.getTopVC(), delegate: self)
    }
    @IBAction func pickAction(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    func didSelect(image: UIImage?) {
        idImage.image = image
    }
}
