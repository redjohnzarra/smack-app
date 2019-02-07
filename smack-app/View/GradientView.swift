//
//  GradientView.swift
//  smack-app
//
//  Created by Reden John Zarra on 07/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var startX: Double = 0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var startY: Double = 0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var endX: Double = 1 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var endY: Double = 1 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startX, y: startY)
        gradientLayer.endPoint = CGPoint(x: endX, y: endY)
        gradientLayer.frame = self.bounds //size of container
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
