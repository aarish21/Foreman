//
//  FMLoginVC.swift
//  Foreman
//
//  Created by Aarish on 31/08/22.
//

import UIKit

class FMLoginVC: UIViewController {

    @IBOutlet weak var loginTV: UITableView!
    var loginVM: FMLoginVM?
    var foreman = Login()
    var alert = ReusableAlert()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loginVM = FMLoginVM(loginVC: self)
        loginVM?.setupTableView()
        // Do any additional setup after loading the view.
    }
    
    @objc func submitAction() {
        FirestoreDB.getData(email: self.foreman.email, password: self.foreman.password) { snapshot in
            
            if snapshot?.value as? String == self.foreman.email {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextViewController = (storyBoard.instantiateViewController(withIdentifier: "ForemanVC") as? ForemanVC)!
                self.navigationController?.pushViewController(nextViewController, animated: true)
            } else {
                self.alert.presentAlertWithTitle(title: "Wrong email or Password", message: "", options: "ok") {_ in}
            }
//            let value = snapshot?.value as? NSDictionary
//            let email = value!["email"] as? String
//            let password = value!["password"] as? String
//            
//            if self.foreman.email == email && self.foreman.password == password {
//                
//            } else {
//            
//            }
        }
        
    }

}

extension FMLoginVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return loginVM?.configureHeadingCell(indexPath: indexPath) ?? UITableViewCell()
        } else if indexPath.row == 1 || indexPath.row == 2 {
            return loginVM?.configureTFCell(indexPath: indexPath) ?? UITableViewCell()
        } else {
            return loginVM?.configureSubmitBtnCell(indexPath: indexPath) ?? UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }
        if indexPath.row == 3 {
            return 170
        }
        return 100
    }
}
