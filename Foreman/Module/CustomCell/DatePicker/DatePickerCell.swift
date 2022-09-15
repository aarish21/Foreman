//
//  DatePickerCell.swift
//  Foreman
//
//  Created by Aarish on 06/09/22.
//

import UIKit

class DatePickerCell: UITableViewCell {

    @IBOutlet weak var endTime: UIDatePicker!
    @IBOutlet weak var startTime: UIDatePicker!
    
    @IBOutlet weak var totalTimeLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(indexPath: IndexPath, data: [EmployHours]) {
        
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar
        components.hour = 1
        let maxDate = calendar.date(byAdding: components, to: currentDate)!
        startTime.maximumDate = Date()
        endTime.maximumDate = maxDate
        
        let num1 = NumberFormatter().number(from: data[indexPath.row-3].startTime)?.doubleValue
        startTime.date = Date(timeIntervalSince1970: num1 ?? Date().timeIntervalSince1970)
        let num2 = NumberFormatter().number(from: data[indexPath.row-3].endTime)?.doubleValue
        endTime.date = Date(timeIntervalSince1970: num2 ?? Date().timeIntervalSince1970)
        
        let totalTime = endTime.date.timeIntervalSince1970 - startTime.date.timeIntervalSince1970
        let (hrs, min) = Utilities.secondsToHoursMinutesSeconds(Int(totalTime))
        totalTimeLbl.text = "\(hrs) hr \(min) min"
        
        startTime.addTarget(self, action: #selector(startTimeChanged), for: .valueChanged)
        endTime.addTarget(self, action: #selector(startTimeChanged), for: .valueChanged)
    }
    
    @objc func startTimeChanged() {
        let totalTime = endTime.date.timeIntervalSince1970 - startTime.date.timeIntervalSince1970
        let (hrs, min) = Utilities.secondsToHoursMinutesSeconds(Int(totalTime))
        totalTimeLbl.text = "\(hrs) hr \(min) min"
    }
    
}
