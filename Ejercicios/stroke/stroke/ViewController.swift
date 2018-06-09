//
//  ViewController.swift
//  stroke
//
//  Created by d182_Jorge_M on 08/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

//class SineView: UIView{
//    let graphWidth: CGFloat = 1  // Graph is 80% of the width of the view
//    let amplitude: CGFloat = 0.3   // Amplitude of sine wave is 30% of view height
//
//    override func draw(_ rect: CGRect) {
//        //let width = rect.width
//        let width : CGFloat = 200.0
//        let height = rect.height
//
//        let origin = CGPoint(x: width * (1 - graphWidth) / 2, y: height * 0.50)
//
//        let path = UIBezierPath()
//        path.move(to: origin)
//
//        for angle in stride(from: 15.0, through: 360.0, by: 5.0) {
//            let x = origin.x + CGFloat(angle/360.0) * width * graphWidth
//            let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * height * amplitude
//            path.addLine(to: CGPoint(x: x, y: y))
//        }
//
//        //UIColor.black.setStroke()
//        path.lineWidth = 25.0
//        path.stroke()
//    }
//}

class ViewController: UIViewController {
    
    var delta : CGFloat = 15.0
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 10.0
        view.layer.addSublayer(shapeLayer)
        drawBezier()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawBezier(){
        let bezier = UIBezierPath()
        let width = view.frame.width - 100
        let height = view.frame.height
        let x = width / 2 - 80
        let y = height / 2
        let long : CGFloat = 16
        let p1 = CGPoint(x: x, y: y)
        let p2 = CGPoint(x: x + 3*long , y: y + -3*long)
        let p3 = CGPoint(x: x + 6 * long, y: y)
        let p4 = CGPoint(x: x + 9 * long , y: y + 3*long)
        let p5 = CGPoint(x: x + 12 * long , y: y - long)
        bezier.move(to: p1)
        bezier.addCurve(to: p3, controlPoint1: p1, controlPoint2: p2)
        bezier.addCurve(to: p5, controlPoint1: p3, controlPoint2: p4)
        shapeLayer.path = bezier.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
    }

    @IBAction func didMoveSlider(_ sender: UISlider) {
        shapeLayer.lineWidth = CGFloat(sender.value)
        drawBezier()
    }
    
}

