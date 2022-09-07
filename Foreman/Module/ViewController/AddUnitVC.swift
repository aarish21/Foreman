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
    var numberOfRows = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addUnitVM = AddUnitVM(addUnitVC: self)
        addUnitVM?.setupTV()
        let button1 = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addUnit))
        self.navigationItem.rightBarButtonItem  = button1
        // Do any additional setup after loading the view.
    }

    @objc func addUnit() {
        numberOfRows+=1
        addUnitTV.reloadData()
    }
}

extension AddUnitVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfRows
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
    
}
