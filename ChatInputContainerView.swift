//
//  ChatInputContainerView.swift
//  RegisterAndChatRoom
//
//  Created by Tian Yu on 2017/4/25.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit

class ChatInputContainerView: UIView, UITextFieldDelegate{

    var chatLogController: ChatLogController? {
        didSet {
            sendButton.addTarget(chatLogController, action: #selector(ChatLogController.handleSend), for: .touchUpInside)
            uploadImageView.addGestureRecognizer(UITapGestureRecognizer(target: chatLogController, action: #selector(ChatLogController.handleUploadTap)))
            //camera程式碼
            cameraImageView.addGestureRecognizer(UITapGestureRecognizer(target: chatLogController, action: #selector(ChatLogController.handleCamera)))
        }
    }
    
    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "輸入訊息"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    let uploadImageView: UIImageView = {
        let uploadImageView = UIImageView()
        uploadImageView.isUserInteractionEnabled = true
        uploadImageView.image = UIImage(named: "pic_Icon_btn .png")
        uploadImageView.translatesAutoresizingMaskIntoConstraints = false
        return uploadImageView
    }()
    
    //照相機功能
    let cameraImageView: UIImageView = {
        let cameraImageView = UIImageView()
        cameraImageView.isUserInteractionEnabled = true
        cameraImageView.image = UIImage(named: "photo_Icon_btn.png")
        cameraImageView.translatesAutoresizingMaskIntoConstraints = false
        return cameraImageView
    }()

    
    
    
    
    
    
    
    
    
    
    let sendButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(uploadImageView)
        
        // Constraint anchors: x, y, width, height
        uploadImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        uploadImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        uploadImageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
        uploadImageView.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        
        // 2017/4/1 Constraint anchors: x, y, width, height
        
        addSubview(cameraImageView)
        
        cameraImageView.leftAnchor.constraint(equalTo: uploadImageView.rightAnchor, constant: 12).isActive = true
        cameraImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cameraImageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
        cameraImageView.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        
        
        
        sendButton.setTitle("傳送", for: .normal)
        sendButton.setTitleColor(UIColor.white, for: .normal)
        sendButton.backgroundColor = UIColor(r: 45, g: 43, b: 82)
        sendButton.titleLabel?.textColor = UIColor.white
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(sendButton)
        
        // Constraint anchors: x, y, width, height
        sendButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        addSubview(self.inputTextField)
        
        // Constraint anchors: x, y, width, height
        self.inputTextField.rightAnchor.constraint(equalTo: sendButton.leftAnchor, constant: -5).isActive = true
        self.inputTextField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        self.inputTextField.widthAnchor.constraint(equalToConstant: 238).isActive = true
        self.inputTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let separatorLineView = UIView()
        separatorLineView.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(separatorLineView)
        
        // Constraint anchors: x, y, width, height
        separatorLineView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separatorLineView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        separatorLineView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        chatLogController?.handleSend()
        return true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
