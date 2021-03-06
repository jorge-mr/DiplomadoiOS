//
//  DetailViewController.swift
//  masterdetail
//
//  Created by d182_Jorge_M on 17/03/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let user = detailUser {
            if let label = detailDescriptionLabel {
                label.text = user.name
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailUser: User? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

