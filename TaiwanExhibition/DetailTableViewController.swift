//
//  DetailTableViewController.swift
//  GoogleNapDemo
//
//  Created by 楷岷 張 on 2017/4/25.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var Detail:Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(getContent(Not:)), name: Notification.Name("arrayNumber"), object: nil)
        
    }
    
    func getContent(Not: Notification) {
        if let number = Not.userInfo?["number"] as? LocationModel {
            Detail = number.detail
        }
    }
    
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//    
    
}
