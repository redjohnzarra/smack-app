//
//  LoginVC.swift
//  smack-app
//
//  Created by Reden John Zarra on 07/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    // Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createAcctBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCT, sender: nil)
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        guard let user = usernameTxt.text , usernameTxt.text != "" else { return }
        guard let pass = passTxt.text , passTxt.text != "" else { return }
        
    }
}
