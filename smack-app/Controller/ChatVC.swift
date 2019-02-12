//
//  ChatVC.swift
//  smack-app
//
//  Created by Reden John Zarra on 07/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            }
        }
        
        MessageService.instance.findAllChannels { (success) in
            
        }
    }

}
