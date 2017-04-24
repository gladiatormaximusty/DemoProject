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

    @IBOutlet weak var profileImageView: UIImageView!
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
            let imageName = NSUUID().uuidString
            let storageRef = FIRStorage.storage().reference().child("profile_images").child("\(imageName).jpg")
            //壓縮圖片
            if let profileImage = self.profileImageView.image, let uploadData = UIImageJPEGRepresentation(profileImage, 0.1){
                storageRef.put(uploadData, metadata: nil, completion: { (metadata, error) in
                    if error != nil {
                        print(error)
                        return
                    }
                    
                    if let profileImageUrl = metadata?.downloadURL()?.absoluteString{
                        //做一個dictionary儲存資料
                        let values = ["name": name, "email":email, "profileImageUrl":profileImageUrl]
                        self.registerUserIntoDatabaseWithUID(uid: uid, values: values)
                    }
                    print(metadata)
                })
            }
            let storyboard = UIStoryboard(name: "AppTableViewController", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
            self.present(mainViewController!, animated: true, completion: nil)
        })
    }
    private func registerUserIntoDatabaseWithUID(uid:String, values:[String:Any]){
        let ref = FIRDatabase.database().reference()
        //生出一個reference的child
        
        let usersReference = ref.child("users").child(uid)
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            if err != nil{
                print(err)
                return
            }
            //第二個畫面回到第一個畫面，用dismiss
            //self.dismiss(animated: true, completion: nil)
           // print("Saved user successfully into Firebase database")
            let user = User()
            user.setValuesForKeys(values)
           // self.messagesController?.setupNavBarWithUser(user: user)
            //self.dismiss(animated: true, completion: nil)
        })
        
    }

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
        profileImageView.isUserInteractionEnabled = true
        
    }
}
