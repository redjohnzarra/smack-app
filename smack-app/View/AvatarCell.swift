//
//  AvatarCell.swift
//  smack-app
//
//  Created by Reden John Zarra on 08/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import UIKit

enum AvatarType {
    case dark
    case light
}

class AvatarCell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func configureCell(index: Int, type: AvatarType) {
        if type == AvatarType.dark {
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
        
        avatarImg.image = UIImage(named: "\(type)\(index)")
    }
    
    func setupView() {
        self.layer.backgroundColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true // make sure that the view doesn't spill outside the corner radius
    }
}
