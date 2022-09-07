//
//  DashboardVC.swift
//  Foreman
//
//  Created by Aarish on 05/09/22.
//

import UIKit

class DashboardVC: UIViewController {
    var dashboardVM: DashboardVM?
    let unitData: [UnitCellData] = [UnitCellData(unit: "100", employHours: "4", equipment: ["Hammer", "Pliers"], equipHours: ["2", "3"]),
                                    UnitCellData(unit: "101", employHours: "6",
                                                 equipment: ["Hammer", "Trenchers", "Bulldozers"], equipHours: ["2", "5", "6"])]
    var height: [Int] = []
    @IBOutlet weak var dashboardTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dashboardVM = DashboardVM(dashboard: self)
        dashboardVM?.setupTableView()
        let button1 = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addUnit))
        self.navigationItem.rightBarButtonItem  = button1
//        FirestoreDB.getData(email: "", password: "") { snapshot in
//            print(snapshot?.value)
//        }
        // Do any additional setup after loading the view.
    }
    @objc func addUnit() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = (storyBoard.instantiateViewController(withIdentifier: "AddUnitVC") as? AddUnitVC)!
        let navController = UINavigationController(rootViewController: nextViewController)
        navController.navigationBar.tintColor = UIColor(named: "fontColor")
        self.present(navController, animated: true, completion: nil)
    }
    
}

extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unitData.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return dashboardVM?.configureGreetingCell(indexPath: indexPath) ?? UITableViewCell()
        }
        if indexPath.row == 1 || indexPath.row == 2 {
            return dashboardVM?.configureUnitCell(indexPath: indexPath) ?? UITableViewCell()
        }
        return dashboardVM?.configureUnitCell(indexPath: indexPath) ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 110
        }
        let count = unitData[indexPath.row-1].equipment.count
        let height = 55 + count * 23
        return  CGFloat(height)
    }
    
}
