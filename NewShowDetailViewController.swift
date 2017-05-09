//
//  NewShowDetailViewController.swift
//  RegisterAndChatRoom
//
//  Created by 楷岷 張 on 2017/5/9.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit

class NewShowDetailViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var URLLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var logoImage: UIImageView!
    
    var imageName:String?
    var selectName:String?
    var selectPhone:String?
    var selectMail:String?
    var selectUrl:String?
    var selectDetail:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        backView.layer.shadowOpacity = 5
        backView.layer.shadowColor = UIColor.gray.cgColor
        backView.layer.shadowRadius = 10.0

        nameLabel.text = selectName
        phoneLabel.text = selectPhone
        mailLabel.text = selectMail
        URLLabel.text = selectUrl
        detailTextView.text = selectDetail
        logoImage.image = UIImage(named: imageName!)
        

        
    }

   
}
