//
//  ChannelVC.swift
//  smack-app
//
//  Created by Reden John Zarra on 07/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    //Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    @IBOutlet weak var userAvatar: CircleImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userAvatar.image = UIImage(named: UserDataService.instance.avatarName)
            userAvatar.backgroundColor = UserDataService.instance.getUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userAvatar.image = UIImage(named: "menuProfileIcon")
            userAvatar.backgroundColor = UIColor.clear
        }
    }
}
