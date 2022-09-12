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
    
    @IBOutlet weak var employee: UICommand!
    @IBOutlet weak var menu: UIMenu!
    @IBOutlet weak var addEmp: UIButton!
    @IBOutlet weak var addEquip: UIButton!
    
    var dashboardVC: DashboardVC?
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
        let startT = data[indexPath.row-1].employHours[0].startTime
        let endT = data[indexPath.row-1].employHours[0].endTime
        let num1 = NumberFormatter().number(from: startT)?.doubleValue
        let num2 = NumberFormatter().number(from: endT)?.doubleValue
        var time = 0
        addEmp.tag = indexPath.row
        if let start = num1, let end = num2 {
            time = Int(end-start)
        }
        let (hours,min,_) = Utilities.secondsToHoursMinutesSeconds(time)
        employHrsLbl.text = "Employee hours: \(hours) hours \(min) minutes "
//        for iter in 0..<data[indexPath.row-1].equipment.count {
//            let element = "\(data[indexPath.row-1].equipment[iter]): \(data[indexPath.row-1].equipHours[iter]) Hrs"
//               let labelNum = UILabel()
//               labelNum.text = element
//            labelNum.font = .systemFont(ofSize: 13)
//               labelNum.textColor = .secondaryLabel
//               labelNum.frame = CGRect( x: 50, y: yPos, width: Int(UIScreen.main.bounds.width), height: 20)
//               yPos += 23
//               self.contentView.addSubview(labelNum)
//           }
        
    }
  
    @IBAction func addEmpAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = (storyBoard.instantiateViewController(withIdentifier: "AddUnitVC") as? AddUnitVC)!
        nextViewController.isFromDashboardCell = true
        let navController = UINavigationController(rootViewController: nextViewController)
        navController.navigationBar.tintColor = UIColor(named: "fontColor")
        self.window?.rootViewController?.present(navController, animated: true, completion: nil)
        
        
    }
    @IBAction func addEquipAction(_ sender: Any) {
    }
}
