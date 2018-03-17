//
//  MainTabViewController.swift
//  automotion
//
//  Created by d182_Jorge_M on 16/03/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    var isPro : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarItems()
    }
    
    func configureTabBarItems(){
        guard let unwrappedItems = self.tabBar.items else { return }
        for item in unwrappedItems {
            item.badgeColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            guard let unwrappedItemTitle = item.title else { continue }
            if unwrappedItemTitle == "groups" {
                item.badgeValue = "0"
                isPro = true
            }
            if unwrappedItemTitle == "shop" {
                item.isEnabled = isPro
                
            }
            print("1")
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
