//
//  DashboardVC.swift
//  Foreman
//
//  Created by Aarish on 05/09/22.
//

import UIKit
import SideMenu
class DashboardVC: UIViewController {
    var dashboardVM: DashboardVM?
    
    var height: [Int] = []
    @IBOutlet weak var dashboardTV: UITableView!
    var unitData: [UnitCellData] = [] {
        didSet {
            dashboardTV.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dashboardVM = DashboardVM(dashboard: self)
        dashboardVM?.setupTableView()
        let button1 = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addUnit))
        let menu = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"),
                                   style: .plain, target: self, action: #selector(showMenu))
        self.navigationItem.leftBarButtonItem  = menu
        self.navigationItem.rightBarButtonItem  = button1
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do {
            let data = try Data(contentsOf: Constants.saveUnitData)
            
            unitData = try JSONDecoder().decode([UnitCellData].self, from: data)
            
        } catch {
            unitData = []
            print("Unable to .")
        }
    }
    @objc func addUnit() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = (storyBoard.instantiateViewController(withIdentifier: "AddUnitVC") as? AddUnitVC)!
        nextViewController.unitData = self.unitData
        nextViewController.modalPresentationStyle = .pageSheet
        let navController = UINavigationController(rootViewController: nextViewController)
        navController.navigationBar.tintColor = UIColor(named: "fontColor")
//        self.present(navController, animated: true, completion: nil)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc func showMenu() {
        let menu = storyboard!.instantiateViewController(withIdentifier: "LeftMenu") as? SideMenuNavigationController
        menu?.presentationStyle = .menuSlideIn
        present(menu!, animated: true, completion: nil)
    }
    func deleteData() {
        do {
            let data = try JSONEncoder().encode(unitData)
            try data.write(to: Constants.saveUnitData, options: .completeFileProtection)

        } catch {
            print("Unable to save data.")
        }
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
        let cell = dashboardVM?.configureUnitCell(indexPath: indexPath) as? UnitCell ?? UnitCell()
//        cell.addEmp.addTarget(self, action: #selector(addEmployAction(sender:)), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 110
        }
        let count = unitData[indexPath.row-1].equipment.count
        let height = 55 + count * 23
        return  CGFloat(height)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted")
          self.dashboardTV.deleteRows(at: [indexPath], with: .automatic)
       
          unitData.remove(at: indexPath.row-1)
          self.deleteData()
          self.dashboardTV.reloadData()
      }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {

            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = (storyBoard.instantiateViewController(withIdentifier: "AddUnitVC") as? AddUnitVC)!
            nextViewController.unitData = self.unitData
            nextViewController.unitCellItem = unitData[indexPath.row-1]
            nextViewController.fromIndex = indexPath.row-1
            nextViewController.isFromDashboardCell = true
           navigationController?.pushViewController(nextViewController, animated: true)
            
//            print(buttonTag)
        }
    }
    
}
