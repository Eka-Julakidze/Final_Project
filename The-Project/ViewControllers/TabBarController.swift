//
//  TabBarController.swift
//  The-Project
//
//  Created by user171840 on 7/5/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
import CoreData

protocol SettingsPageDelegate {
    func reloadUsers()
}

class TabBarController: UITabBarController {
    static let id = "TabBarController"
    var currentUser: User?
    var tabBarDelegate : SettingsPageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = self.viewControllers?[1] as! SettingsViewController
        settings.currentUser = currentUser!
    }
    

}
