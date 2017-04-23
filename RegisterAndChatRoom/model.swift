//
//  model.swift
//  Demo
//
//  Created by 楷岷 張 on 2017/4/17.
//  Copyright © 2017年 Edward. All rights reserved.
//

import Foundation

class testManModel {
    var name:String
    var photo:String
    
    init(name:String, photo:String) {
        self.name = name
        self.photo = photo
    }
}


extension DemandViewController {
    
    func dateCkeckItem() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        dateTextField.resignFirstResponder()
        datTextField.becomeFirstResponder()
        
    }
    func dateCancelItem() {
        dateTextField.resignFirstResponder()
    }
    
    func dayCheckItem() {
        datTextField.text = day[dayPicker.selectedRow(inComponent: 0)]
        datTextField.resignFirstResponder()
        locationTextField.becomeFirstResponder()
    }
    
    func dayCancelItem() {
        datTextField.resignFirstResponder()
    }
    
    func locationCheckItem() {
        locationTextField.text = location[locationPicker.selectedRow(inComponent: 0)]
        locationTextField.resignFirstResponder()
        genderTextField.becomeFirstResponder()
    }
    
    func locationCancelItem() {
        locationTextField.resignFirstResponder()
    }
    
    func genderCheckItem() {
        genderTextField.text = gender[genderPicker.selectedRow(inComponent: 0)]
        genderTextField.resignFirstResponder()
        enterButton.isHidden = false
    }
    
    func genderCancelItem() {
        genderTextField.resignFirstResponder()
    }
}

