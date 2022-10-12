//
//  AddUnit.swift
//  Foreman
//
//  Created by Aarish on 06/09/22.
//

import UIKit
import CoreData

class AddUnitVC: UIViewController {
    @IBOutlet weak var addUnitTV: UITableView!
    var addUnitVM: AddUnitVM?
    var isFromDashboardCell = false
    var employData = [EmployHours]()
    var selectedData: UnitCellData? = nil
    //    var unitData: [UnitCellData] = []
    //    var employData: [EmployHours] = []
    var rowCount = 0
    var fromIndex = 0
    var datePickerIndex = 0
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
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
        
        
        if selectedData == nil {
            let entity = NSEntityDescription.entity(forEntityName: "UnitCellData", in: context!)
            let newData = UnitCellData(entity: entity!, insertInto: context)
            let indexPath = IndexPath(row: 1, section: 0)
            let cell: TextfieldCell = (addUnitTV.cellForRow(at: indexPath) as? TextfieldCell)!
            newData.unit = cell.inputTextfield.text
           
            for index in 0..<rowCount {
                let indexPath = IndexPath(row: index+3, section: 0)
                let cell: DatePickerCell = (addUnitTV.cellForRow(at: indexPath) as? DatePickerCell)!
                let empHours = EmployHours()
                empHours.entryTime = "\(Date().timeIntervalSince1970)"
                empHours.endTime = "\(cell.endTime.date.timeIntervalSince1970)"
                empHours.startTime = "\(cell.startTime.date.timeIntervalSince1970)"
                newData.employHours?.append(empHours)
                print(cell)
            }
            
            do {
                try self.context?.save()
                unitData.append(newData)
            } catch {
                print("cannot save :", error.localizedDescription)
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UnitCellData")
            do {
                let results: NSArray = try (context?.fetch(request))! as NSArray
                for result in results {
                    let indexPath = IndexPath(row: 1, section: 0)
                    let cell: TextfieldCell = (addUnitTV.cellForRow(at: indexPath) as? TextfieldCell)!
                    let unit = result as? UnitCellData
                    if unit == selectedData {
                        unit?.unit = cell.inputTextfield.text
                        if let employCount = selectedData?.employHours?.count {
                            for index in 0..<employCount {
                                let indexPath = IndexPath(row: index+3, section: 0)
                                let cell: DatePickerCell = (addUnitTV.cellForRow(at: indexPath) as? DatePickerCell)!
                                let empHours = EmployHours()
                                empHours.entryTime = "\(Date().timeIntervalSince1970)"
                                empHours.endTime = "\(cell.endTime.date.timeIntervalSince1970)"
                                empHours.startTime = "\(cell.startTime.date.timeIntervalSince1970)"
                                unit?.employHours?[index] = empHours
                                print(cell)
                            }
                        }
                        try context?.save()
                        navigationController?.popViewController(animated: true)
                    }
                }
            } catch {
                print("Fetch Failed")
            }
        }
        //        if !isFromDashboardCell {
        //
        //            unitData.append(unitCellItem)
        //            print(unitData)
        //        } else {
        //            unitData[fromIndex] = unitCellItem
        //        }
        //        do {
        //            try self.context?.save()
        //        } catch {
        //            print(error.localizedDescription)
        //        }
        
        //
        
    }
    @objc func addUnit() {

        rowCount += 1
        addUnitTV.reloadData()
        
    }
}

extension AddUnitVC: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let employCount = selectedData?.employHours?.count ?? 0
        if employCount == 0 {
            return rowCount + 3
        }
        return employCount + 3
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
