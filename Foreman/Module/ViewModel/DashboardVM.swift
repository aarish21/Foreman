//
//  DashboardVM.swift
//  Foreman
//
//  Created by Aarish on 05/09/22.
//

import Foundation
import UIKit
class DashboardVM {
    var dashboardVC: DashboardVC?
    init(dashboard: DashboardVC) {
        self.dashboardVC = dashboard
    }
    func setupTableView() {
        
        dashboardVC?.dashboardTV.delegate = dashboardVC
        dashboardVC?.dashboardTV.dataSource = dashboardVC
        dashboardVC?.dashboardTV.register(UINib(nibName: Constants.greetingsCell, bundle: .main),
                                          forCellReuseIdentifier: Constants.greetingsCell)
        dashboardVC?.dashboardTV.register(UINib(nibName: Constants.unitCell, bundle: .main),
                                          forCellReuseIdentifier: Constants.unitCell)
    }
    func configureGreetingCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = dashboardVC?.dashboardTV.dequeueReusableCell(withIdentifier: Constants.greetingsCell,
                                                    for: indexPath) as? GreetingsCell ?? GreetingsCell()
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        return cell
    }
    func configureUnitCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = dashboardVC?.dashboardTV.dequeueReusableCell(withIdentifier: Constants.unitCell,
                                                    for: indexPath) as? UnitCell ?? UnitCell()
        cell.setup(data: dashboardVC?.unitData ?? [], indexPath: indexPath)
        
      
        return cell
    }
    
    
}
