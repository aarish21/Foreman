//
//  ViewController.swift
//  Foreman
//
//  Created by Aarish on 07/09/22.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet weak var sideMenuTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuTV.delegate = self
        sideMenuTV.dataSource = self
        
        sideMenuTV.register(UINib(nibName: Constants.headingCell, bundle: .main), forCellReuseIdentifier: Constants.headingCell)
        // Do any additional setup after loading the view.
    }

}
extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sideMenuTV.dequeueReusableCell(withIdentifier: Constants.headingCell,
                                                    for: indexPath) as? HeadingCell ?? HeadingCell()
        cell.headingLbl.text = "Aarish Rahman"
        return cell
    }
    
}
