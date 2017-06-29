//
//  ViewController.swift
//  RegisterAndChatRoom
//
//  Created by Tian Yu on 2017/4/22.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit
import Firebase
class LoginController: UIViewController, UITextFieldDelegate {
    
    var messagesController: MessagesController?

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func RegisterButton(_ sender: UIButton) {
        switchToHandleRegister()
    }
    @IBAction func LoginButton(_ sender: UIButton) {
        
        handleLogin()
    }
    func handleLogin() {
        guard let email = emailTextField.text, let password = passwordTextField.text else{
            return
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                let alert = UIAlertController(title: "", message: "信箱密碼輸入不正確", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            self.messagesController?.fetchUserAndSetupNavBarTitle()
//            let storyboard = UIStoryboard(name: "AppTableViewController", bundle: nil)
//            let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
//            self.present(mainViewController!, animated: true, completion: nil)
            if UserDefaults.standard.bool(forKey: "openFirstController") != true {
                let storyboard = UIStoryboard(name: "requirement", bundle: nil)
                let requirement = storyboard.instantiateViewController(withIdentifier: "requirement")
                self.present(requirement, animated: true, completion: nil)
            } else {
                let storyboard = UIStoryboard(name: "AppTableViewController", bundle: nil)
                let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
                self.present(mainViewController!, animated: true, completion: nil)

            }
            
            print("login successfully")
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        return true
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        
    }
    
    func switchToHandleRegister(){
        let signupViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "RegisterController") as? RegisterController
        self.navigationController?.pushViewController(signupViewControllerObj!, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        //外加的，但沒效用！！！
          self.setNeedsStatusBarAppearanceUpdate()
    }
    //外加的，但沒效用！！
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    

}
extension UIColor{
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
