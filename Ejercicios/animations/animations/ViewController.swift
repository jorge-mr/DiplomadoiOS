//
//  ViewController.swift
//  animations
//
//  Created by d182_Jorge_M on 12/05/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttonx: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonx.bounds = CGRect(x: buttonx.center.x, y: buttonx.center.y, width: buttonx.bounds.width / 10.0, height: buttonx.bounds.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTaped(_ sender: UIButton) {
        let anima = CAKeyframeAnimation(keyPath: "backgroundColor")
        anima.keyTimes = [0.0, 1/4, 2/4, 3/4, 1.0] as? [NSNumber]
        anima.values = [#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1).cgColor, #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor, #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor, #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1).cgColor, #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).cgColor]
        anima.duration = 0.3
        anima.repeatCount = Float.infinity
        sender.layer.add(anima, forKey: "backgroundColorBlink")
        
        

//        UIView.animate(withDuration: 3, animations: {
//            self.buttonx.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//            self.buttonx.backgroundColor = .green
//        }) { (success) in
//            guard success else { return }
//            UIView.animate(withDuration: 3, animations: {
//                self.buttonx.transform = CGAffineTransform.identity
//                self.buttonx.backgroundColor = .blue
//            })
//        }
    }
    
}

