//
//  SearchAnimatedViewController.swift
//  FinalProject-requirement
//
//  Created by 楷岷 張 on 2017/4/18.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit

class SearchAnimatedViewController: UIViewController {
    
    
    @IBOutlet weak var testView: UIView!
    
    @IBOutlet weak var pointAnimated: UILabel!
    
    let point = ["", "。", "。。", "。。。"]
    var pointNumber = 0
    var nextController = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.isNavigationBarHidden = true
        testView.layer.cornerRadius = 60
        testView.clipsToBounds = true

        Timer.scheduledTimer(timeInterval: 0.5
            , target: self, selector: #selector(changePoint), userInfo: nil, repeats: true)
        
            Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { (_) in
                self.nextViewController(next: self.nextController)
        }
            }
    
    func changePoint() {
        if pointNumber == 0 {
            pointAnimated.text = point[0]
            pointNumber += 1
        } else if pointNumber == 1 {
            pointAnimated.text = point[1]
            pointNumber += 1
        } else if pointNumber == 2 {
            pointAnimated.text = point[2]
            pointNumber += 1
        } else if pointNumber == 3 {
            pointAnimated.text = point[3]
            pointNumber  = 0
        }
    }
    
    func nextViewController(next: Bool) {
        if next == false {
            let storyboard = UIStoryboard(name: "requirement", bundle: nil)
            let TranslatorViewController = storyboard.instantiateViewController(withIdentifier: "TranslatorViewController")
            navigationController?.pushViewController(TranslatorViewController, animated: true)
        } else {
            return
        }
    }

}
