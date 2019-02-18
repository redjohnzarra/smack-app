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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAcctBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCT, sender: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = usernameTxt.text , usernameTxt.text != "" else { return }
        guard let pass = passTxt.text , passTxt.text != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    func getAttributePlaceholderColor(field: String) -> NSAttributedString {
        return NSAttributedString(string: field, attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
    }
    
    func setupView() {
        spinner.isHidden = true
        usernameTxt.attributedPlaceholder = getAttributePlaceholderColor(field: "username")
        passTxt.attributedPlaceholder = getAttributePlaceholderColor(field: "password")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAcctVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        UIView.animate(withDuration: 0.2) {
            self.view.endEditing(true)
        }
    }
}
