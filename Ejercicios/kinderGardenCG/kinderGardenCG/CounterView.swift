//
//  CounterView.swift
//  kinderGardenCG
//
//  Created by d182_Jorge_M on 16/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

@IBDesignable
class CounterView: UIView {

    @IBInspectable var counterColor: UIColor = UIColor.orange
    
    @IBInspectable var counter : Int = 5 {
        didSet {
            if counter <= Constants.numberOfGlasses {
                //refresh the view
                setNeedsDisplay()
            }
        }
    }
    
    private struct Constants {
        static var numberOfGlasses = 8
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        let startAngle : CGFloat = 3 * .pi / 4
        let endAngle : CGFloat = .pi / 4
        
        let path = UIBezierPath(arcCenter: center, radius: radius/2 - 76/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.lineWidth = 76
        counterColor.setStroke()
        path.stroke()
        
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        let arcLenghtPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
        let outLineEndAngle = arcLenghtPerGlass * CGFloat(counter) + startAngle
        
        let outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2 - 4, startAngle: startAngle, endAngle: outLineEndAngle, clockwise: true)
        
        outlinePath.addArc(withCenter: center, radius: bounds.width/2 - 76 + 4, startAngle: outLineEndAngle, endAngle: startAngle, clockwise: false)
        outlinePath.close()
        outlinePath.lineWidth = 8
        #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1).setStroke()
        outlinePath.stroke()
        
        
    }
 

}
