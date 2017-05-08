//
//  TranslatorDetailViewController.swift
//  FinalProject-requirement
//
//  Created by 楷岷 張 on 2017/4/22.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseAuth


class TranslatorDetailViewController: UIViewController {

    @IBOutlet weak var translatorImage: UIImageView!
    @IBOutlet weak var imageBackgroungView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeButtonChangeImage: UIButton!
    @IBOutlet weak var nextView: UIView!
    @IBOutlet weak var selectTimeTextField: UITextField!
    
    @IBOutlet weak var reservationTime: UITextField!
    @IBAction func selectTimeAction(_ sender: UITextField) {
        datePickerView(sender: sender)
    }
    
    @IBAction func backBarButtonItem(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func reservationButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "是否要將此行程加進行事曆", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: { _ in
            
            
                let storyboard = UIStoryboard(name: "AppTableViewController", bundle: nil)
                let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
                self.navigationController?.pushViewController(mainViewController, animated: true)
                
                UserDefaults.standard.set(true, forKey: "openFirstController")
                
            let properties: [String: Any] = ["text": "系統通知：您與\((self.name)!)的預約以完成。諮詢時間為\((self.theSelectorTime)!)"]
                self.sendMessageWithProperties(properties: properties)
        

        }))
        alert.addAction(UIAlertAction(title: "NO", style: .cancel, handler: { _ in
            let storyboard = UIStoryboard(name: "AppTableViewController", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
            self.navigationController?.pushViewController(mainViewController, animated: true)
            
            UserDefaults.standard.set(true, forKey: "openFirstController")
            
            let properties: [String: Any] = ["text": "系統通知：您與\((self.name)!)的預約以完成。諮詢時間為\((self.theSelectorTime)!)"]
            self.sendMessageWithProperties(properties: properties)
            
        }))
        present(alert, animated: true, completion: nil)
        
    }

    @IBAction func checkButton(_ sender: UIButton) {
//        let alert = UIAlertController(title: "預約成功", message: "是否要將此行程加進行事曆", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: { _ in
//            
//            let storyboard = UIStoryboard(name: "AppTableViewController", bundle: nil)
//            let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
//            self.navigationController?.pushViewController(mainViewController, animated: true)
//            
//            UserDefaults.standard.set(true, forKey: "openFirstController")
//
//        }))
//        alert.addAction(UIAlertAction(title: "NO", style: .cancel, handler: { _ in
//            let storyboard = UIStoryboard(name: "AppTableViewController", bundle: nil)
//            let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
//            self.navigationController?.pushViewController(mainViewController, animated: true)
//            
//            UserDefaults.standard.set(true, forKey: "openFirstController")
//
//        }))
//       present(alert, animated: true, completion: nil)
      
    }
    
    func sendMessageWithProperties(properties: [String: Any]) {
        let ref = FIRDatabase.database().reference().child("Messages")
        let childRef = ref.childByAutoId()
        let toId = "kpZ2AxnddKYRfogzg8rKngv15Fi2"
        let fromId = "3saSLTVY23Wq1aPjqZhKUm7zf573"
        let timestamp = NSNumber(value: Int(Date().timeIntervalSince1970))
        var values: [String: Any] = ["toId": toId as Any, "fromId": fromId as Any, "timestamp": timestamp]
        
        // key $0, value $1
        properties.forEach({values[$0] = $1})
        
        childRef.updateChildValues(values) { (error, ref) in
            if error != nil {
                print(error!)
                return
            }
            
            
            let userMessagesRef = FIRDatabase.database().reference().child("user-messages").child(fromId).child(toId)
            
            let messageId = childRef.key
            userMessagesRef.updateChildValues([messageId: 1])
            
            let recipientUserMessagesRef = FIRDatabase.database().reference().child("user-messages").child(toId).child(fromId)
            recipientUserMessagesRef.updateChildValues([messageId: 1])
        }
    }

    
    var theSelectorTime:String?
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
        datePicker.minuteInterval = 10
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
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        selectTimeTextField.text = dateFormatter.string(from: datePicker.date)
        selectTimeTextField.resignFirstResponder()
        
    }

}
