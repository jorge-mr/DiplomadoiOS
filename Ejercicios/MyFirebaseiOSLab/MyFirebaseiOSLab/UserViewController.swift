//
//  UserViewController.swift
//  MyFirebaseiOSLab
//
//  Created by d182_Jorge_M on 05/05/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit
import Firebase

class UserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Salir", style: .plain, target: self, action: #selector(logOutUser))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @objc func logOutUser(){
        do{
            try Auth.auth().signOut()
            self.navigationController?.popViewController(animated: true)
            print("adios")
        }catch let error {
            print(error.localizedDescription)
        }
    }
}
