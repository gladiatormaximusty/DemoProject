//
//  model.swift
//  Demo
//
//  Created by 楷岷 張 on 2017/4/17.
//  Copyright © 2017年 Edward. All rights reserved.
//

import Foundation

class WizardModel {
    var name:String
    var photo:String
    var detail:String
    
    init(name:String, photo:String, detail:String) {
        self.name = name
        self.photo = photo
        self.detail = detail
    }
}


extension DemandViewController {
    
    func dateCheckItem() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        locationTextField.becomeFirstResponder()
    }
    
    func dateCancelItem() {
        dateTextField.resignFirstResponder()
    }
    
    func locationCheckItem() {
        locationTextField.text = location[locationPicker.selectedRow(inComponent: 0)]
        locationTextField.resignFirstResponder()
    }
    
    func locationCancelItem() {
        locationTextField.resignFirstResponder()
    }
}

let wizard:[WizardModel] = [
    WizardModel(name: "Dr Aung Kyaw Myint", photo: "wizard1", detail: "經歷：\n\n- 4年醫藥業務經歷\n\n- 新聞產業顧問\n\n- 2年美國猶太人聯合分配委員會專案經理\n\n- 5年緬甸話同步翻譯經驗"), WizardModel(name: "MS Ho Thi Hong Lien", photo: "wizard2", detail: "經歷：\n\n- Limkokwing大學國際貿易研究，從事越南及東南亞市場研究\n\n- Sinh Tai貿易公司國貿助理\n\n- Jonny Walker酒商代理商策展員\n\n- Wide-Link Group科技項目撰文\n\n- The World’s Music業務助理"),WizardModel(name: "Mr DUC", photo: "", detail: "經歷：\n\n- 美國特許金融分析師執照\n\n- 法國英士國際商學院MBA學位\n\n- 熟悉越南金融、生產製造及醫藥產業\n\n- 5年日商工作經驗\n\n- 曾服務客戶包括：Amcham, EuroCham, JETRO, JICA, 及超過100家越南公司。"),WizardModel(name: "Mr Siew Kooi Kam", photo: "wizard3", detail: "經歷：\n\n- 機械及土木工程專長\n\n- 曾任職日本清水建設工程設計部主管\n\n- 也擔任過日本富士玻纖計畫主要顧問\n\n- 具有多國外派經驗，包括杜拜、日本、台灣及新加坡"),WizardModel(name: "Mr. Melon", photo: "wizard4", detail: "經歷：\n\n- 企業管理背景\n\n- 曾於台灣政治大學留學一年\n\n- 目前於BBF&Peepia擔任業務開發主管\n\n- 2年行銷總監經歷於Anantara Vacation Club"), WizardModel(name: "Mr PHIRUN NOP", photo: "wizard5", detail: "經歷：\n\n- 資訊及金融背景\n\n- 目前擔任緬甸國家銀行商業分析師，負責金融及大數據分析。\n\n- 具有ACCA會計師認證\n\n- 曾於法國SKEMA商學院攻讀企業管理學位")
]


