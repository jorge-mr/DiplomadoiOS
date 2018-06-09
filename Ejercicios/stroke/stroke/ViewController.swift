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
    
    let shapeLayer = CAShapeLayer()
    let startLayer = CAShapeLayer()
    let endLayer = CAShapeLayer()
    var startPoint : CGPoint!
    var endPoint : CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backColor =  #colorLiteral(red: 0.5921568627, green: 0.9843137255, blue: 0.8156862745, alpha: 1)
        shapeLayer.strokeColor = backColor.cgColor
        startLayer.strokeColor = backColor.cgColor
        endLayer.strokeColor = backColor.cgColor
        shapeLayer.lineWidth = 10.0
        shapeLayer.actions = ["lineWidth":NSNull(), "position" : NSNull(), "bounds" : NSNull(), "path" : NSNull()]
        startLayer.actions = ["lineWidth":NSNull(), "position" : NSNull(), "bounds" : NSNull(), "path" : NSNull()]
        endLayer.actions = ["lineWidth":NSNull(), "position" : NSNull(), "bounds" : NSNull(), "path" : NSNull()]
        view.layer.addSublayer(shapeLayer)
        view.layer.addSublayer(startLayer)
        view.layer.addSublayer(endLayer)
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
        startPoint = CGPoint(x: x, y: y)
        let p2 = CGPoint(x: x + 3*long , y: y + -3*long)
        let p3 = CGPoint(x: x + 6 * long, y: y)
        let p4 = CGPoint(x: x + 9 * long , y: y + 3*long)
        endPoint = CGPoint(x: x + 12 * long , y: y - long)
        bezier.move(to: startPoint)
        bezier.addCurve(to: p3, controlPoint1: startPoint, controlPoint2: p2)
        bezier.addCurve(to: endPoint, controlPoint1: p3, controlPoint2: p4)
        shapeLayer.path = bezier.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
    }
    
    func drawRight(thickness : CGFloat){
        let bezier = UIBezierPath()
        bezier.move(to: endPoint)
        let p1 = CGPoint(x: endPoint.x - thickness, y: endPoint.y - thickness)
        let p2 = CGPoint(x: endPoint.x + thickness, y: endPoint.y - thickness)
        let p3 = CGPoint(x: endPoint.x + thickness, y: endPoint.y + thickness)
        bezier.addLine(to: p1)
        bezier.addLine(to: p2)
        bezier.addLine(to: p3)
        bezier.close()
        endLayer.path = bezier.cgPath
        endLayer.fillColor = #colorLiteral(red: 0.5921568627, green: 0.9843137255, blue: 0.8156862745, alpha: 1).cgColor
            }

    @IBAction func didMoveSlider(_ sender: UISlider) {
        let thickness = CGFloat(sender.value)
        shapeLayer.lineWidth = thickness
        drawBezier()
        drawRight(thickness: thickness)
    }
    
}

