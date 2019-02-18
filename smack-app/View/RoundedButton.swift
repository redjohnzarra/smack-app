//
//  RoundedButton.swift
//  smack-app
//
//  Created by Reden John Zarra on 08/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView() // to reflect changes on storyboard immediately
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
}
