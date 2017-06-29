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
    @IBOutlet weak var imageBackgroungView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeButtonChangeImage: UIButton!
    @IBOutlet weak var nextView: UIView!
    @IBOutlet weak var selectTimeTextField: UITextField!
    
    @IBAction func selectTimeAction(_ sender: UITextField) {
        datePickerView(sender: sender)
    }
    
    @IBAction func backBarButtonItem(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func reservationButton(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0) {
            self.nextView.isHidden = false
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { _ in
                self.selectTimeTextField.becomeFirstResponder()
            })
        }
    }

    @IBAction func checkButton(_ sender: UIButton) {
        
    }
   
    var arrayNumber:Int?
    var name:String?
    var image:String?
    let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        NotificationCenter.default.post(name: Notification.Name("getNumber"), object: nil, userInfo: ["showDetailNumber": arrayNumber!])
        imageBackgroungView.clipsToBounds = true
        imageBackgroungView.layer.cornerRadius = imageBackgroungView.frame.height / 2
        translatorImage.layer.cornerRadius = translatorImage.frame.height / 2
        translatorImage.clipsToBounds = true
        nameLabel.text = name
        translatorImage.image = UIImage(named: image!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
    }
    
    
    func datePickerView(sender: UITextField) {
        datePicker.datePickerMode = .dateAndTime
        datePicker.locale = NSLocale(localeIdentifier: "Chinese") as Locale
//        設定時間間距
        datePicker.minuteInterval = 30
        let date = Date()
        datePicker.minimumDate = date

        selectTime(sender: sender)
    }
    
    func selectTime(sender: UITextField) {
        sender.becomeFirstResponder()
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.barTintColor = UIColor(red: 177.0/255, green: 177.0/255, blue: 189.0/255.0, alpha: 1)
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let checkButton = UIBarButtonItem(title: "Check", style: .plain, target: self, action: #selector(checkButtonItem))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonItem))
        
        toolBar.setItems([cancelButton, spaceButton, checkButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        selectTimeTextField.inputView = datePicker
        selectTimeTextField.inputAccessoryView = toolBar
        selectTimeTextField.inputView?.backgroundColor = UIColor(red: 177.0/255, green: 177.0/255, blue: 189.0/255.0, alpha: 1)
    }
    
    func cancelButtonItem() {
        selectTimeTextField.resignFirstResponder()
        nextView.isHidden = true
    }
    
    func checkButtonItem() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        selectTimeTextField.text = dateFormatter.string(from: datePicker.date)
        selectTimeTextField.resignFirstResponder()
        
    }

}
