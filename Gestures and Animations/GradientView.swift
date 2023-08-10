//
//  GradientView.swift
//  Gestures and Animations
//
//  Created by Ajay Sarkate on 04/08/23.
//

import UIKit

class GradientView: UIView {
    
    var gradientLayer: CAGradientLayer!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        if let layer = gradientLayer {
//            layer.removeFromSuperlayer()
//        }
//
//        gradientLayer = CAGradientLayer()
//        gradientLayer.frame = self.bounds
//        gradientLayer.colors = [UIColor.systemRed.cgColor, UIColor.systemPink.cgColor, UIColor.blue.cgColor, UIColor.systemPurple.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0.3, y: 0.9)
//
//        layer.addSublayer(gradientLayer)
//    }
}
