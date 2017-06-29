//
//  RecordModel.swift
//  RegisterAndChatRoom
//
//  Created by 楷岷 張 on 2017/5/5.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit

class RecordMoedel {
    var name:String?
    var image:String?
    var pdfName:String?
    
    init(name:String,image:String,pdfName:String) {
        self.name = name
        self.image = image
        self.pdfName = pdfName
    }
}

class PartnersModel {
    var name:String?
    var detail:String?
    var phone:String?
    var email:String?
    var url:String?
    var logoImage:String?
    
    init(name:String, detail:String, phone:String, email:String, url:String, logoImage:String
        ) {
        self.name = name
        self.detail = detail
        self.phone = phone
        self.email = email
        self.url = url
        self.logoImage = logoImage
    }
    
}
