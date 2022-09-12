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
    
    @IBOutlet weak var totalTIme: UIDatePicker!
    var start: ((_ value: String?) -> Void)?
    var end: ((_ value: String?) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup() {
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar
        components.minute = 30
        let maxDate = calendar.date(byAdding: components, to: currentDate)!
        startTime.maximumDate = Date()
        endTime.maximumDate = maxDate
       
        startTime.addTarget(self, action: #selector(startTimeChanged), for: .valueChanged)
//        let formatter = RelativeDateTimeFormatter()
//        formatter.unitsStyle = .full
//        let relativeDate = formatter.localizedString(for: startTime.date, relativeTo: endTime.date)
//        print(relativeDate)
        
    }
    @objc func startTimeChanged() {
//        let formatter = RelativeDateTimeFormatter()
//        formatter.unitsStyle = .full
//        let date = Calendar.current.dateComponents([.day], from: startTime.date, to: endTime.date).hour
//        let relativeDate = formatter.calendar.dateComponents([.minute,.hour,.second], from: startTime.date, to: endTime.date).hour
//        let relativeDate = formatter.localizedString(for: startTime.date, relativeTo: endTime.date)
//        print(relativeDate)
        
        start!(String(startTime.date.timeIntervalSince1970))
        end!(String(endTime.date.timeIntervalSince1970))
    }
    
    
}
