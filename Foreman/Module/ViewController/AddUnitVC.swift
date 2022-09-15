//
//  AddUnit.swift
//  Foreman
//
//  Created by Aarish on 06/09/22.
//

import UIKit

class AddUnitVC: UIViewController {
    @IBOutlet weak var addUnitTV: UITableView!
    var addUnitVM: AddUnitVM?
    var isFromDashboardCell = false
    var unitCellItem = UnitCellData()
    var employData: [EmployHours] = []
    var empHrs = EmployHours() {
        didSet {
//            item.employHours[datePickerIndex-3].startTime = empHrs.startTime
//            item.employHours[datePickerIndex].startTime = empHrs.endTime
//            addUnitTV.reloadData()
        }
    }
    var fromIndex = 0
    var datePickerIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addUnitVM = AddUnitVM(addUnitVC: self)
        
        addUnitVM?.setupTV()
        let button2 = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneAction))
        let button1 = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addUnit))
        self.navigationItem.rightBarButtonItems  = [button2, button1]
        // Do any additional setup after loading the view.
    }
    @objc func doneAction() {
        for index in 0..<unitCellItem.employHours.count {
            let indexPath = IndexPath(row: index, section: 0)
            let cell = addUnitTV.dequeueReusableCell(withIdentifier: Constants.datePickerCell,
                                                     for: indexPath) as? DatePickerCell ?? DatePickerCell()
//            unitCellItem.employHours[indexPath.row] = EmployHours(startTime: "\(cell.startTime.date.timeIntervalSince1970)",
//                                                          endTime: "\(cell.endTime.date.timeIntervalSince1970)",
//                                                          entryTime: "\(Date().timeIntervalSince1970)")
            print(cell)
        }
      
//        if !isFromDashboardCell {
//            unitCellItem.employHours.append(empHrs)
//            unitData.append(item)
//            print(unitData)
//        } else {
//            unitData[fromIndex] = unitCellItem
//        }

        do {
            let data = try JSONEncoder().encode([unitCellItem])
            try data.write(to: Constants.saveUnitData, options: .completeFileProtection)
        } catch {
            print("Unable to save data.")
        }
//
        self.navigationController?.popViewController(animated: true)
        
    }
    @objc func addUnit() {
        
        let addEmployHours = EmployHours(startTime: "0",
                                         endTime: "0",
                                         entryTime: "\(Date().timeIntervalSince1970)")
        unitCellItem.employHours.append(addEmployHours)
        addUnitTV.reloadData()
        
    }
}

extension AddUnitVC: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unitCellItem.employHours.count + 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return addUnitVM?.configureGreetingCell(indexPath: indexPath) ?? UITableViewCell()
        }
        if indexPath.row == 1 {
           
            return addUnitVM?.configureTFCell(indexPath: indexPath) ?? UITableViewCell()
        }
        if indexPath.row == 2 {
            return addUnitVM?.configureHeadingCell(indexPath: indexPath) ?? UITableViewCell()
        }
        
        return addUnitVM?.configureDatePicker(indexPath: indexPath) ?? UITableViewCell()
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        }
        if indexPath.row == 2 {
            return 30
        }
        if indexPath.row == 1 {
            return 100
        }
        return 100
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 1 {
            return false
        }
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted")

        self.addUnitTV.deleteRows(at: [indexPath], with: .automatic)
      }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn: "0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    
}
extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
