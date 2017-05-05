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

  
    @IBOutlet weak var backScrollView: UIScrollView!
    
    @IBOutlet weak var quoteImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backScrollView.delegate = self
        backScrollView.maximumZoomScale = 2.0
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        quoteImage.image = UIImage(named: "Quotes")
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return quoteImage
    }

}
