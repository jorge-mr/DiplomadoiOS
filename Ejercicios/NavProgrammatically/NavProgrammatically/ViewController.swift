//
//  ViewController.swift
//  NavProgrammatically
//
//  Created by d182_Jorge_M on 09/03/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switcher: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func azulAccion(_ sender: UIButton) {
        if switcher.isOn {
            performSegue(withIdentifier: "azulSegue", sender: nil)
        }
    }
    
    @IBAction func lilaAccion(_ sender: UIButton) {
        if switcher.isOn {
            performSegue(withIdentifier: "lilaSegue", sender: nil)
        }
    }
    

}

