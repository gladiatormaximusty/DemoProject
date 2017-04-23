//
//  ViewController.swift
//  RegisterAndChatRoom
//
//  Created by Tian Yu on 2017/4/22.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit
import Firebase
class LoginController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func LoginButton(_ sender: UIButton) {
        
        handleLogin()
    }
    
    
    
    func handleLogin() {
        guard let email = emailTextField.text, let password = passwordTextField.text else{
            return
        }
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                print("跳出警告控制器提醒使用者ex:帳號密碼不符！！請重新輸入！！")
                return
            }
            
            
            
            print("login successfully")
        })
        
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    
    
    
    }

   
}

