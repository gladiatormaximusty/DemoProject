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
    var messagesController: MessagesController?
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
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                let alert = UIAlertController(title: "登入失敗", message: "信箱密碼輸入不正確", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            guard let uid = user?.uid else{
                return
            }
            let imageName = NSUUID().uuidString
            let storageRef = Storage.storage().reference().child("profile_images").child("\(imageName).jpg")
            //壓縮圖片
            if let profileImage = self.profileImageView.image, let uploadData = UIImageJPEGRepresentation(profileImage, 0.1){
                storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
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
                    })
    }
    private func registerUserIntoDatabaseWithUID(uid:String, values:[String:Any]){
        let ref = Database.database().reference()
        //生出一個reference的child
        
        let usersReference = ref.child("users").child(uid)
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            if err != nil{
                print(err)
                return
            }
            let user = User()
            user.setValuesForKeys(values)
            self.messagesController?.setupNavBarWithUser(user: user)
            let storyboard = UIStoryboard(name: "AppTableViewController", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
            self.present(mainViewController!, animated: true, completion: nil)


        })
        
    }

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
        profileImageView.isUserInteractionEnabled = true
        
    }
}
