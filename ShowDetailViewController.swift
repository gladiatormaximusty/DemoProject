//
//  ShowDetailViewController.swift
//  RegisterAndChatRoom
//
//  Created by 楷岷 張 on 2017/5/5.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit
import WebKit

class ShowDetailViewController: UIViewController, UIScrollViewDelegate {

//    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var backView: UIScrollView!
    var image = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        backView.delegate = self
        
        backView.maximumZoomScale = 4.0
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        let weight = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height - UIApplication.shared.statusBarFrame.height - (navigationController?.navigationBar.frame.height)! - (tabBarController?.tabBar.frame.height)!
        
        backView.isPagingEnabled = true
        backView.contentSize = CGSize(width: weight, height: height * 5)
        for i in 0...4 {
            image = UIImageView(frame: CGRect(x: 0, y: height * CGFloat(i), width: weight, height: height))
            image.contentMode = .scaleAspectFit
            image.image = UIImage(named: "Tea\(i).png")
            backView.addSubview(image)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
    
}
