//
//  TabBarController.swift
//  Qorsat
//
//  Created by Ahsan Mughal on 18/02/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class TabBarController:   UITabBarController{
    
    override func viewDidLoad() {
     
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "Futura", size: 15)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)

    }

}
