//
//  FMSignUpVC.swift
//  Foreman
//
//  Created by Aarish on 23/08/22.
//

import Foundation
import UIKit

class FMSignUpVC: UIViewController {
    @IBOutlet var signUpTV: UITableView!
    let placeholder = ["Name*", "Address*", "Age*", "Experience in Years*"]
    override func viewDidLoad() {
        signUpTV.delegate = self
        signUpTV.dataSource = self
        self.navigationItem.title = Constants.signUpTitle
        signUpTV.register(UINib(nibName: "TextfieldCell", bundle: .main), forCellReuseIdentifier: "signUpCell")
        signUpTV.register(UINib(nibName: "ButtonCell", bundle: .main), forCellReuseIdentifier: "button")
        signUpTV.register(UINib(nibName: "IDImageCell", bundle: .main), forCellReuseIdentifier: "img")
        super.viewDidLoad()
    }
}

extension FMSignUpVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "button", for: indexPath) as? ButtonCell
            cell?.setup()
            return cell!
        } else if  indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "img", for: indexPath) as? IDImageCell
            cell?.pickImage()
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "signUpCell", for: indexPath) as? TextfieldCell
            cell?.setup()
            cell?.textfield.placeholder = self.placeholder[indexPath.row]
            return cell!
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 5 {
            return 100
        }
        if indexPath.row == 4 {
            return 380
        }
        return 50
    }
}
