//
//  CreateAcctVC.swift
//  smack-app
//
//  Created by Reden John Zarra on 07/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import UIKit

class CreateAcctVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    // Variables
    var avatarName = "smackProfileIcon"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColor == nil {
                userImg.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        // Where or if ang , . guard let unwrap optional values
        guard let name = usernameTxt.text , usernameTxt.text != "" else { return }
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let pass = passTxt.text , passTxt.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
                                // Notification post to manipulate other VC (See ChannelVC)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBgColorPressed(_ sender: Any) {
        let r = getRandomColorNumber()
        let g = getRandomColorNumber()
        let b = getRandomColorNumber()
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1) // 1 for not transparent
        avatarColor = "[\(r), \(g), \(b), 1]"
        // Animate the changing of bg color
        UIView.animate(withDuration: 0.2) {
            self.userImg.backgroundColor = self.bgColor
        }
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    
    func getRandomColorNumber() -> CGFloat {
        return CGFloat(arc4random_uniform(255)) / 255
    }
    
    func getAttributePlaceholderColor(field: String) -> NSAttributedString {
        return NSAttributedString(string: field, attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
    }
    
    func setupView() {
        spinner.isHidden = true
        usernameTxt.attributedPlaceholder = getAttributePlaceholderColor(field: "username")
        emailTxt.attributedPlaceholder = getAttributePlaceholderColor(field: "email")
        passTxt.attributedPlaceholder = getAttributePlaceholderColor(field: "password")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAcctVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    // Closes keyboard if open
    @objc func handleTap() {
        UIView.animate(withDuration: 0.2) {
            self.view.endEditing(true)
        }
    }
}
