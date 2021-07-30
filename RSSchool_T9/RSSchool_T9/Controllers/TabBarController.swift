//
//  TabBarController.swift
//  RSSchool_T9
//
//  Created by Mikita Shalima on 28.07.21.
//

import UIKit

class TabBarController: UITabBarController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.tabBar.tintColor = UIColor.systemRed
        //UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 20)], for: .selected)
    }
    
}
