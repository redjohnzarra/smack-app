//
//  TextFieldWithPadding.swift
//  smack-app
//
//  Created by Reden John Zarra on 13/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import UIKit

@IBDesignable
class TextFieldWithPadding: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 35)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
