//
//  showDetailViewController.swift
//  FinalProject-requirement
//
//  Created by 楷岷 張 on 2017/5/2.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit

class showDetailViewController: UIViewController {

    @IBOutlet weak var showDetail: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(arrayNumber(Not:)), name: Notification.Name("getNumber"), object: nil)
        self.showDetail.isEditable = false
        
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showDetail.setContentOffset(.zero, animated: true)
    }
    
    func arrayNumber(Not:Notification) {
        if let number = Not.userInfo?["showDetailNumber"] as? Int {
            showDetail.text = wizard[number].detail
        }
    }
}
