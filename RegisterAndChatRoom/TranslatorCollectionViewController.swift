//
//  TranslatorCollectionViewController.swift
//  FinalProject-requirement
//
//  Created by 楷岷 張 on 2017/5/1.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit
import SVProgressHUD

class TranslatorCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var hidden = false
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show(withStatus: "搜尋中...")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: (view.frame.width - 80) / 2, height: ((view.frame.width - 80) / 2) * 1.31)
        layout.sectionInset = UIEdgeInsets(top: 58, left: 25, bottom: 0, right: 25)
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 30
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wizard.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TranslatorCollectionViewCell
        if hidden == false {
            Timer.scheduledTimer(withTimeInterval: 1.3, repeats: false) { _ in
                cell.backgroundViewSet.isHidden = false
                SVProgressHUD.showSuccess(withStatus: "完成")
                SVProgressHUD.dismiss(withDelay: 1.5)
                self.hidden = true
            }
        }

        cell.backgroundViewSet.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        cell.backgroundViewSet.layer.shadowOpacity = 1
        cell.backgroundViewSet.layer.shadowColor = UIColor.gray.cgColor
        cell.backgroundViewSet.layer.shadowRadius = 5.0
        
        cell.nameLabel.text = wizard[indexPath.row].name
        cell.imageIndex.image = UIImage(named: wizard[indexPath.row].photo)
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "requirement", bundle: nil)
        let TranslatorDetailViewController = storyboard.instantiateViewController(withIdentifier: "TranslatorDetailViewController") as! TranslatorDetailViewController
        
        TranslatorDetailViewController.arrayNumber = indexPath.row
        TranslatorDetailViewController.name = wizard[indexPath.row].name
        TranslatorDetailViewController.image = wizard[indexPath.row].photo
        
        navigationController?.pushViewController(TranslatorDetailViewController, animated: true)
    }
    
    
    
    
    


}
