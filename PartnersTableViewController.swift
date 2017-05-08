//
//  PartnersTableViewController.swift
//  RegisterAndChatRoom
//
//  Created by 楷岷 張 on 2017/5/8.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit

class PartnersTableViewController: UITableViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var mail: UILabel!
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var showDetail: UITextView!
    
    var imageName:String?
    var selectName:String?
    var selectPhone:String?
    var selectMail:String?
    var selectUrl:String?
    var selectDetail:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImage.image = UIImage(named: imageName!)
        name.text = selectName
        phone.text = selectPhone
        mail.text = selectMail
        url.text = selectUrl
        showDetail.text = selectDetail
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showDetail.setContentOffset(.zero, animated: false)
    }
}
