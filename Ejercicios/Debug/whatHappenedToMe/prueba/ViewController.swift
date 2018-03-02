//
//  ViewController.swift
//  prueba
//
//  Created by markmota on 2/24/18.
//  Copyright © 2018 markmota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //agregué @IBOutlet
    @IBOutlet weak var outtletText: UITextField!
    //borre la a
    @IBOutlet weak var outletButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        outletButton.setTitle("Touch me!", for: .normal)
        
    }
    
    //agregue IBAction y cambie any a UIButton
    @IBAction func actionButton(_ sender: UIButton) {
        outtletText.text = "You are a genius "
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    


}

