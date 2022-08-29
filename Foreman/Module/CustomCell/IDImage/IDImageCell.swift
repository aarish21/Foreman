//
//  idImageVC.swift
//  Foreman
//
//  Created by Aarish on 23/08/22.
//

import Foundation
import UIKit
import SwiftUI
protocol IDImageCellDelegate: AnyObject {
    func didSelectImage(with isSelect: Bool)
}
class IDImageCell: UITableViewCell, ImagePickerDelegate {
    @IBOutlet weak var idImage: UIImageView!
    var imagePicker: ImagePicker!
    var isImageSelected: ((_ value: Bool)->())?
    weak var delegate: IDImageCellDelegate?
    func pickImage() {
        self.imagePicker = ImagePicker(presentationController: Utilities.getTopVC(), delegate: self)
    }
    @IBAction func pickAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.imagePicker.present(from: sender)
        }
    }
    func didSelect(image: UIImage?) {
        idImage.image = image
//        delegate?.didSelectImage(with: true)
        isImageSelected?(true)
    }
}
