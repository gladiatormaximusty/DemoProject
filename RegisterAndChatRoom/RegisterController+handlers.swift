//
//  RegisterController+handlers.swift
//  RegisterAndChatRoom
//
//  Created by Tian Yu on 2017/4/24.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit
import Firebase
extension RegisterController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func handleSelectProfileImageView(){
        let picker = UIImagePickerController()
        picker.delegate = self
        //可以改掉大頭貼
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //設一個UIImage，並存在一個變數var裡面：
        var selectedImageFromPicker: UIImage?
        
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            //如果選到照片，即放上照片
            
            selectedImageFromPicker = editedImage
            
            print(editedImage.size)
        }else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            //如果沒選，則放上原本的照片
            selectedImageFromPicker = originalImage
            
            print(originalImage.size)
        }
        
        if let selectedImage = selectedImageFromPicker {
            profileImageView.image = selectedImage
        }
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        print("123")
    }

}
