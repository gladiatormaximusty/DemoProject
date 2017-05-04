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
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBAction func dateAction(_ sender: UITextField) {
        datePickerView(sender: sender)
    }
    
    @IBAction func locationAction(_ sender: UITextField) {
        setToolBar(sender: sender)
    }
    
    
    
    @IBAction func enterIndexButton(_ sender: UIButton) {
        if dateTextField.text != nil || locationTextField.text != nil {
            let storyboard = UIStoryboard(name: "requirement", bundle: nil)
            let translatorCollectionViewController = storyboard.instantiateViewController(withIdentifier: "TranslatorCollectionViewController")
            navigationController?.pushViewController(translatorCollectionViewController, animated: true)
            
        } else {
            let alert = UIAlertController(title: "錯誤", message: "輸入框請勿空白", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    let location = ["泰國", "馬來西亞"]
    let datePicker = UIDatePicker()
    let locationPicker = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationPicker.delegate = self
        locationPicker.dataSource = self
        
        
        let datePlacegolder = NSAttributedString(string: "請選擇出發日期", attributes: [NSForegroundColorAttributeName : UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.5)])
        
        dateTextField.attributedPlaceholder = datePlacegolder
        
        let locationPlacegolder = NSAttributedString(string: "請選擇國家", attributes: [NSForegroundColorAttributeName : UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.5)])
        
        locationTextField.attributedPlaceholder = locationPlacegolder
        
        
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        dateTextField.becomeFirstResponder()
    }
    
    func datePickerView(sender: UITextField) {
        datePicker.datePickerMode = .date
        datePicker.locale = NSLocale(localeIdentifier: "Chinese") as Locale
        let formatter = DateFormatter()
        let date = Date()
        datePicker.minimumDate = date
        
        
        setToolBar(sender: sender)
    }
    
    func setToolBar(sender:UITextField) {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.barTintColor = UIColor(red: 177.0/255, green: 177.0/255, blue: 189.0/255.0, alpha: 1)

        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        switch sender.tag {
        case 1:
            let checkButton = UIBarButtonItem(title: "check", style: .plain, target: self, action: #selector(dateCheckItem))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            let cancelButton = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(dateCancelItem))
            
            toolBar.setItems([cancelButton, spaceButton, checkButton], animated: true)
            toolBar.isUserInteractionEnabled = true
            
            dateTextField.inputView = datePicker
            dateTextField.inputAccessoryView = toolBar
            dateTextField.inputView?.backgroundColor = UIColor(red: 177.0/255, green: 177.0/255, blue: 189.0/255.0, alpha: 1)
        case 2:
            let checkButton = UIBarButtonItem(title: "check", style: .plain, target: self, action: #selector(locationCheckItem))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            let cancelButton = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(locationCancelItem))
            toolBar.setItems([cancelButton, spaceButton, checkButton], animated: true)
            
            
            locationTextField.inputView = locationPicker
            locationTextField.inputAccessoryView = toolBar
            locationTextField.inputView?.backgroundColor = UIColor(red: 177.0/255, green: 177.0/255, blue: 189.0/255.0, alpha: 1)
        default:
            break
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return location.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return location[row]
    }

}

