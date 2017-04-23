//
//  RegisterController.swift
//  RegisterAndChatRoom
//
//  Created by Tian Yu on 2017/4/23.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit
import Firebase

class RegisterController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func RegisterButton(_ sender: UIButton) {
       handleRegister()
    }
    
    func handleRegister() {
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else{
            print("Form is not available")
            return
        }
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user: FIRUser?, error) in
            if error != nil {
                print("提示警告輸入筐提醒使用者輸入正確")
                return
            }
            guard let uid = user?.uid else{
                return
            }
            let ref = FIRDatabase.database().reference()
            let usersReference = ref.child("users").child(uid)
            let values = ["name":name, "email":email]
            usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                if err != nil {
                    print("err")
                    return
                }
            })
        })
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
