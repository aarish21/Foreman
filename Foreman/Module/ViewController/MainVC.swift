//
//  MainVC.swift
//  Foreman
//
//  Created by Aarish on 29/08/22.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        
    }

    @IBAction func signUpAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = (storyBoard.instantiateViewController(withIdentifier: "FMSignUpVC") as? FMSignUpVC)!
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    @IBAction func loginAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = (storyBoard.instantiateViewController(withIdentifier: "FMLoginVC") as? FMLoginVC)!
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    func setupView() {
        signUpBtn.layer.cornerRadius = 15
        loginBtn.layer.cornerRadius = 15
    }

}
