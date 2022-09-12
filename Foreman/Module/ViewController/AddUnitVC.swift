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
    var unitData: [UnitCellData] = []
    var numberOfRows = 4
    var isFromDashboardCell = false
    var item = UnitCellData()
    var employData: [EmployHours] = []
    var empHrs = EmployHours()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addUnitVM = AddUnitVM(addUnitVC: self)
        
        addUnitVM?.setupTV()
        let button1 = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addUnit))
        self.navigationItem.rightBarButtonItem  = button1
        let button2 = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneAction))
        self.navigationItem.leftBarButtonItem  = button2
        // Do any additional setup after loading the view.
    }
    @objc func doneAction() {
        item.employHours.append(empHrs)
        unitData.append(item)
        print(unitData)
        
        do{
            let data = try JSONEncoder().encode(unitData)
            try data.write(to: Constants.saveUnitData, options: .completeFileProtection)

        } catch {
            print("Unable to save data.")
        }
        self.navigationController?.popViewController(animated: true)
        
    }
    @objc func addUnit() {
        numberOfRows+=1
//        let item = EmployHours(startTime: <#T##String#>, endTime: <#T##String#>, entryTime: <#T##String#>)
        addUnitTV.reloadData()
    }
}

extension AddUnitVC: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
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

        self.numberOfRows-=1
          
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
