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
    
    var dashboardVC: DashboardVC?
    var yPos = 50
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(data: [UnitCellData], indexPath: IndexPath) {
        
        unitLbl.text = "Unit \(data[indexPath.row-1].unit ?? "")"
        
        // calculating total hours for each cell in dashboardVC
        var totalHours = 0
//        if let empHours  = data[indexPath.row-1].employHours {
//            for index in 0..<empHours.count {
//                let startT = empHours[index].startTime ?? "0"
//                let endT = empHours[index].endTime ?? "0"
//                let num1 = NumberFormatter().number(from: startT)?.doubleValue
//                let num2 = NumberFormatter().number(from: endT)?.doubleValue
//
//                if let start = num1, let end = num2 {
//                    totalHours += Int(end-start)
//
//                    let (hours, min) = Utilities.secondsToHoursMinutesSeconds(Int(end-start))
//                    let element = "\(hours) hr \(min) min"
//                    let labelNum = UILabel()
//                    labelNum.text = element
//                    labelNum.font = .systemFont(ofSize: 13)
//                    labelNum.textColor = .secondaryLabel
//                    labelNum.frame = CGRect( x: 50, y: yPos, width: Int(UIScreen.main.bounds.width), height: 20)
//                    yPos += 23
//                    self.contentView.addSubview(labelNum)
//
//                }
//
//                let (hours, min) = Utilities.secondsToHoursMinutesSeconds(totalHours)
//                employHrsLbl.text = "Employee hours: \(hours) hr \(min) min "
//
//            }
//        }
        
       
        let (hours, min) = Utilities.secondsToHoursMinutesSeconds(totalHours)
        employHrsLbl.text = "Employee hours: \(hours) hr \(min) min "
        
    }
  
}
