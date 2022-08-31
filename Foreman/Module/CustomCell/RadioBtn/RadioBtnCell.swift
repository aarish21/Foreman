//
//  RadioBtnCell.swift
//  Foreman
//
//  Created by Aarish on 31/08/22.
//

import UIKit

class RadioBtnCell: UITableViewCell {

    @IBOutlet weak var managerBtn: UIButton!
    @IBOutlet weak var foremanBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var callBackForOption: ((_ value: Int) -> Void)?
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func selectedOption(_ isOption1Selected: Bool) {
        managerBtn.isSelected = isOption1Selected
        foremanBtn.isSelected = !isOption1Selected
    }
    @IBAction func option1Selected(_ sender: Any) {
        selectedOption(true)
        callBackForOption!(1)
    }

    @IBAction func option2Selected(_ sender: Any) {
        selectedOption(false)
        callBackForOption!(2)
    }
}
