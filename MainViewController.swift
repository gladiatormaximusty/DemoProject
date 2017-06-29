//
//  MainViewController.swift
//  RegisterAndChatRoom
//
//  Created by Tian Yu on 2017/4/23.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillLayoutSubviews() {
        var test:CGRect = self.tabBar.frame 
        test.size.height = 50
        test.origin.y = self.view.frame.size.height - 50
        self.tabBar.frame = test
        
        
        
    }
}
