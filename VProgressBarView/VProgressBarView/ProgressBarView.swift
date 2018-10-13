//
//  ProgressBarView.swift
//  DariaApp
//
//  Created by Vikash on 06/10/18.
//  Copyright © 2018 Vikash Kumar. All rights reserved.
//

import UIKit

@IBDesignable
class VProgressBarView: UIView {
   
    @IBInspectable var progress: CGFloat = 0 {
        didSet {
            set(progress: progress)
        }
    }
    
    var gradientLayer = CAGradientLayer()
    
    var gradientColors = [UIColor.green, UIColor.blue]
    
    var barCornerRadius: CGFloat = 0
    var barBorderWidth: CGFloat = 1
    var barBorderColor: UIColor = UIColor.black
    
    func initialSetup() {
        self.layer.addSublayer(gradientLayer)
        self.setup()
    }
    
    func setup() {
        gradientLayer.colors = gradientColors.map({ $0.cgColor })

        gradientLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderWidth = barBorderWidth
        self.layer.borderColor = barBorderColor.cgColor
        self.clipsToBounds = true
        
        gradientLayer.cornerRadius = self.frame.height/2

        set(progress: progress)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        initialSetup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func set(progress: CGFloat) {
        var grFrame = gradientLayer.frame
        grFrame.size.width = self.frame.width * progress
        self.gradientLayer.frame = grFrame
    }
    
}
