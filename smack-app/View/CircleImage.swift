//
//  CircleImage.swift
//  smack-app
//
//  Created by Reden John Zarra on 09/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {
    // IBInspectable is not needed cause value will not be changed on UI
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
