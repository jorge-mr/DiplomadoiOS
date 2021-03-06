//
//  CountterButton.swift
//  kinderGardenCG
//
//  Created by d182_Jorge_M on 16/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

@IBDesignable
class CountterButton: UIButton {
    
    private var halfWidth : CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight : CGFloat{
        return bounds.height / 2
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).setFill()
        path.fill()
        
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        let halfPlusWidth = plusWidth / 2
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = 3.0
        
        plusPath.move(to: CGPoint(x: halfWidth - halfPlusWidth, y: halfHeight))
        plusPath.addLine(to: CGPoint(x: halfWidth + halfPlusWidth, y: halfHeight))
        
        plusPath.move(to: CGPoint(x: halfWidth, y: halfHeight - halfPlusWidth))
        plusPath.addLine(to: CGPoint(x: halfWidth, y: halfHeight + halfPlusWidth))
        
        UIColor.white.setStroke()
        plusPath.stroke()
    }

}
