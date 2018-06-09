//
//  ViewController.swift
//  stroke
//
//  Created by d182_Jorge_M on 08/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var delta : CGFloat = 15.0
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(shapeLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hypotenuse(_ a: CGFloat) -> CGFloat {
        return (a * a + a * a).squareRoot()
    }
    
    func drawBezier(){
        let bezier = UIBezierPath()
        let width = view.frame.width
        let height = view.frame.height
        let x = width / 2 - 80
        let y = height / 2
        
        let long : CGFloat = 50
//        let p1 = CGPoint(x: x - delta, y: y - delta)
//        let p2 = CGPoint(x: x - delta, y: y - long - delta)
//        let p3 = CGPoint(x: x + long - delta, y: y - long - delta)
//        let p4 = CGPoint(x: x + 2 * long - delta, y: y - long - delta)
//        let p5 = CGPoint(x: x + 2 * long - delta, y: y - 2 * long - delta)
//        let p6 = CGPoint(x: x + 2 * long + delta, y: y - 2 * long + delta)
//        let p7 = CGPoint(x: x + 2 * long + delta, y: y - long + delta)
//        let p8 = CGPoint(x: x + long + delta, y: y - long + delta)
//        let p9 = CGPoint(x: x + delta , y: y - long + delta)
//        let p10 = CGPoint(x: x + delta , y: y + delta)
        let p1 = CGPoint(x: x - delta, y: y - delta)
        let p2 = CGPoint(x: x + long , y: y - long - hypotenuse(delta))
        let p3 = CGPoint(x: x + 2 * long + delta, y: y - delta)
        let p4 = CGPoint(x: x + 3 * long , y: y + long - hypotenuse(delta))
        let p5 = CGPoint(x: x + 4 * long - delta , y: y - delta)
        let p6 = CGPoint(x: x + 4 * long + delta, y: y + delta)
        let p7 = CGPoint(x: x + 3 * long , y: y + long + hypotenuse(delta))
        let p8 = CGPoint(x: x + 2 * long - delta, y: y + delta)
        let p9 = CGPoint(x: x + long , y: y - long + hypotenuse(delta))
        let p10 = CGPoint(x: x + delta , y: y + delta)
        
        
        // https://mathematica.stackexchange.com/questions/28202/vary-the-thickness-of-a-plotted-function
        bezier.move(to: p1)
        // bezier.addLine(to: CGPoint(x: width, y: height))
//        bezier.addQuadCurve(to: p3, controlPoint: p2)
//        bezier.addQuadCurve(to: <#T##CGPoint#>, controlPoint: <#T##CGPoint#>)
        
        
//        ///
        bezier.addCurve(to: p3, controlPoint1: p1, controlPoint2: p2)
        bezier.addCurve(to: p5, controlPoint1: p3, controlPoint2: p4)
        bezier.addLine(to: p6)
        bezier.addCurve(to: p8, controlPoint1: p6, controlPoint2: p7)
        bezier.addCurve(to: p10, controlPoint1: p8, controlPoint2: p9)
        bezier.addLine(to: p1)
        bezier.close()
        shapeLayer.path = bezier.cgPath
        shapeLayer.fillColor = UIColor.blue.cgColor
    }

    @IBAction func didMoveSlider(_ sender: UISlider) {
        delta = CGFloat(sender.value)
        drawBezier()
    }
    
}

