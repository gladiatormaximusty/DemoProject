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
