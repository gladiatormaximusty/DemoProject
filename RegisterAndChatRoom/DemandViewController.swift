//
//  DemandViewController.swift
//  Demo
//
//  Created by 楷岷 張 on 2017/4/16.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit

class DemandViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var datTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    
    @IBAction func dateDetailSet(_ sender: UITextField) {
        datePickerView(sender: sender)
    }
    @IBAction func datset(_ sender: UITextField) {
        toolBar(sender: sender)
    }
    @IBAction func locationset(_ sender: UITextField) {
         toolBar(sender: sender)
    }
    @IBAction func genderset(_ sender: UITextField) {
        toolBar(sender: sender)
    }
 
    @IBOutlet weak var enterButton: UIButton!
    
    @IBAction func enterIndexButton(_ sender: UIButton) {
        if dateTextField.text != nil || datTextField.text != nil || locationTextField.text != nil || genderTextField.text != nil {
            let storyboard = UIStoryboard(name: "requirement", bundle: nil)
            let TranslatorViewController = storyboard.instantiateViewController(withIdentifier: "TranslatorViewController")
            navigationController?.pushViewController(TranslatorViewController, animated: true)
            
        } else {
            let alert = UIAlertController(title: "錯誤", message: "輸入框請勿空白", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    let day = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"]
    let location = ["泰國", "馬來西亞"]
    let gender = ["不拘","男","女"]
    
    let datePicker = UIDatePicker()
    let dayPicker = UIPickerView()
    let locationPicker = UIPickerView()
    let genderPicker = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayPicker.delegate = self
        dayPicker.dataSource = self
        
        locationPicker.delegate = self
        locationPicker.dataSource = self
        
        genderPicker.delegate = self
        genderPicker.dataSource = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        dateTextField.becomeFirstResponder()
    }
    
    func datePickerView(sender: UITextField) {
        datePicker.datePickerMode = .date
        datePicker.locale = NSLocale(localeIdentifier: "Chinese") as Locale
        
        toolBar(sender: sender)
        
    }
    
    func toolBar(sender: UITextField) {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        switch sender.tag {
        case 1:
            let checkButton = UIBarButtonItem(title: "check", style: .plain, target: self, action: #selector(dateCkeckItem))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            let cancelItem = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(dateCancelItem))
            toolBar.setItems([cancelItem, spaceButton, checkButton], animated: true)
            toolBar.isUserInteractionEnabled = true
            
            sender.inputView = datePicker
            sender.inputAccessoryView = toolBar
        case 2:
            let checkButton = UIBarButtonItem(title: "check", style: .plain, target: self, action: #selector(dayCheckItem))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            let cancelItem = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(dayCancelItem))
            toolBar.setItems([cancelItem, spaceButton, checkButton], animated: true)
            toolBar.isUserInteractionEnabled = true
            
            sender.inputView = dayPicker
            sender.inputAccessoryView = toolBar
        case 3:
            let checkButton = UIBarButtonItem(title: "check", style: .plain, target: self, action: #selector(locationCheckItem))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            let cancelItem = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(locationCancelItem))
            toolBar.setItems([cancelItem, spaceButton, checkButton], animated: true)
            toolBar.isUserInteractionEnabled = true
            
            sender.inputView = locationPicker
            sender.inputAccessoryView = toolBar
        case 4:
            let checkButton = UIBarButtonItem(title: "check", style: .plain, target: self, action: #selector(genderCheckItem))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            let cancelItem = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(genderCancelItem))
            toolBar.setItems([cancelItem, spaceButton, checkButton], animated: true)
            toolBar.isUserInteractionEnabled = true
            
            sender.inputView = genderPicker
            sender.inputAccessoryView = toolBar
        default:
            break
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == dayPicker {
            return day.count
        } else if pickerView == locationPicker {
            return location.count
        } else {
            return gender.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == dayPicker {
            return day[row]
        } else if pickerView == locationPicker {
            return location[row]
        } else {
            return gender[row]
        }
    }

}

