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
    @IBOutlet weak var idImage: UIImageView!
    var imagePicker: ImagePicker!
    var isImageSelected: ((_ value: Bool) -> Void)?
    func pickImage() {
        self.imagePicker = ImagePicker(presentationController: Utilities.getTopVC(), delegate: self)
        let tap = UITapGestureRecognizer(target: self, action: #selector(addAction))
        idImage.addGestureRecognizer(tap)
        idImage.isUserInteractionEnabled = true
    }
    @IBAction func pickAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.imagePicker.present(from: sender)
        }
    }
    @objc func addAction(sender: UITapGestureRecognizer) {
        self.imagePicker.present(from: sender.view!)
    }
    func didSelect(image: UIImage?) {
        idImage.image = image
//        imagePicker.pickerController.resignFirstResponder()
//        delegate?.didSelectImage(with: true)
        isImageSelected?(true)
    }
}
