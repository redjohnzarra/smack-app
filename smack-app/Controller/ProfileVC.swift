//
//  ProfileVC.swift
//  smack-app
//
//  Created by Reden John Zarra on 08/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeModalPressed(_ sender: Any) {
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
    }
}
