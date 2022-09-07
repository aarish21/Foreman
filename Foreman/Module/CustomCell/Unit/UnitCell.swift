//
//  UnitCell.swift
//  Foreman
//
//  Created by Aarish on 05/09/22.
//

import UIKit

class UnitCell: UITableViewCell {
    
    @IBOutlet weak var employHrsLbl: UILabel!
    @IBOutlet weak var unitLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var yPos = 50
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(data: [UnitCellData], indexPath: IndexPath) {
        unitLbl.text = "Unit \(data[indexPath.row-1].unit)"
        employHrsLbl.text = "Employ hours: \(data[indexPath.row-1].employHours)"
        for iter in 0..<data[indexPath.row-1].equipment.count {
            let element = "\(data[indexPath.row-1].equipment[iter]): \(data[indexPath.row-1].equipHours[iter]) Hrs"
               let labelNum = UILabel()
               labelNum.text = element
            labelNum.font = .systemFont(ofSize: 13)
               labelNum.textColor = .secondaryLabel
               labelNum.frame = CGRect( x: 50, y: yPos, width: Int(UIScreen.main.bounds.width), height: 20)
               yPos += 23
               self.contentView.addSubview(labelNum)
           }
       
    }
    
}
