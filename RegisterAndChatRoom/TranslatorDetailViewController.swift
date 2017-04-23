//
//  TranslatorDetailViewController.swift
//  FinalProject-requirement
//
//  Created by 楷岷 張 on 2017/4/22.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit

class TranslatorDetailViewController: UIViewController {

    @IBOutlet weak var translatorImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func reservationButton(_ sender: UIButton) {
        
        
    }
   
    var photoName:String?
    var Name:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        translatorImage.layer.cornerRadius = translatorImage.frame.height / 2
        translatorImage.clipsToBounds = true
        
        translatorImage.image = UIImage(named: photoName!)
        nameLabel.text = Name

    }
    
    

    
}
