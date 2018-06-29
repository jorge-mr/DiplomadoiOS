//
//  ViewController.swift
//  stroke
//
//  Created by d182_Jorge_M on 08/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

enum Shape {
    case triangle
    case square
    case circle
}

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
        let width = view.frame.width - 80
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
    
    func drawEndShape(thickness : CGFloat, shape: Shape){
        var bezier = UIBezierPath()
        bezier.move(to: endPoint)
        switch shape {
        case .circle:
            let p0 = CGPoint(x: endPoint.x - thickness * 1.3, y: endPoint.y - thickness + (1.3))
            let squareWidth = hypotenuse(endPoint.x - p0.x,endPoint.y - p0.y) / 1.5
            let p1 = CGPoint(x: endPoint.x + squareWidth/2.0, y: endPoint.y - squareWidth/1.5)
            bezier = UIBezierPath(arcCenter: p1, radius: squareWidth, startAngle: 0.0, endAngle: 180.0, clockwise: true)
        case .square:
            let p0 = CGPoint(x: endPoint.x - thickness * 1.3, y: endPoint.y - thickness + (1.3))
            let squareWidth = hypotenuse(endPoint.x - p0.x,endPoint.y - p0.y)
            let p1 = CGPoint(x: endPoint.x - squareWidth / 2 - thickness * 0.05, y: endPoint.y - squareWidth / 2 + thickness * 0.05)
            let p2 = CGPoint(x: p1.x + squareWidth, y: p1.y - squareWidth)
            let p3 = CGPoint(x: p2.x + squareWidth, y: p2.y + squareWidth)
            let p4 = CGPoint(x: p3.x - squareWidth, y: p3.y + squareWidth)
            bezier.addLine(to: p1)
            bezier.addLine(to: p2)
            bezier.addLine(to: p3)
            bezier.addLine(to: p4)
            bezier.addLine(to: p1)
            
        case .triangle:
            let p1 = CGPoint(x: endPoint.x - thickness * 1.1, y: endPoint.y - thickness + (thickness * 0.1))
            let p2 = CGPoint(x: endPoint.x + thickness * 0.9, y: endPoint.y - thickness - (thickness * 0.1))
            let p3 = CGPoint(x: endPoint.x + thickness * 1.1, y: endPoint.y + thickness - (thickness * 0.1))
            bezier.addLine(to: p1)
            bezier.addLine(to: p2)
            bezier.addLine(to: p3)
            bezier.close()
        }
        startLayer.path = bezier.cgPath
        startLayer.fillColor = #colorLiteral(red: 0.5921568627, green: 0.9843137255, blue: 0.8156862745, alpha: 1).cgColor
    }
    
    func hypotenuse(_ a: CGFloat, _ b: CGFloat) -> CGFloat {
        return (a * a + b * b).squareRoot()
    }
    
    func drawStartShape(thickness : CGFloat, shape : Shape){
        var bezier = UIBezierPath()
        bezier.move(to: startPoint)
        switch shape {
        case .circle:
            let p0 = CGPoint(x: startPoint.x - thickness * 1.3, y: startPoint.y - thickness + (1.3))
            let squareWidth = hypotenuse(startPoint.x - p0.x,startPoint.y - p0.y) / 1.5
            let p1 = CGPoint(x: startPoint.x - squareWidth/2.0, y: startPoint.y + squareWidth/1.5)
            bezier = UIBezierPath(arcCenter: p1, radius: squareWidth, startAngle: 0.0, endAngle: 180.0, clockwise: true)
        case .square:
            let p0 = CGPoint(x: startPoint.x - thickness * 1.3, y: startPoint.y - thickness + (1.3))
            let squareWidth = hypotenuse(startPoint.x - p0.x,startPoint.y - p0.y)
            let p1 = CGPoint(x: startPoint.x - squareWidth / 2 , y: startPoint.y - squareWidth / 2)
            let p2 = CGPoint(x: p1.x - squareWidth, y: p1.y + squareWidth)
            let p3 = CGPoint(x: p2.x + squareWidth, y: p2.y + squareWidth)
            let p4 = CGPoint(x: p3.x + squareWidth, y: p3.y - squareWidth)
            bezier.addLine(to: p1)
            bezier.addLine(to: p2)
            bezier.addLine(to: p3)
            bezier.addLine(to: p4)
            bezier.addLine(to: p1)
        case .triangle:
            let p1 = CGPoint(x: startPoint.x - thickness * 1.0, y: startPoint.y - thickness)
            let p2 = CGPoint(x: startPoint.x - thickness * 1.0, y: startPoint.y + thickness)
            let p3 = CGPoint(x: startPoint.x + thickness * 1.0, y: startPoint.y + thickness)
            bezier.addLine(to: p1)
            bezier.addLine(to: p2)
            bezier.addLine(to: p3)
            bezier.close()
        }
        endLayer.path = bezier.cgPath
        endLayer.fillColor = #colorLiteral(red: 0.5921568627, green: 0.9843137255, blue: 0.8156862745, alpha: 1).cgColor
    }

    @IBAction func didMoveSlider(_ sender: UISlider) {
        let thickness = CGFloat(sender.value)
        shapeLayer.lineWidth = thickness
        drawBezier()
        drawStartShape(thickness: thickness, shape: .triangle)
        drawEndShape(thickness: thickness, shape: .triangle)
    }
    
}

