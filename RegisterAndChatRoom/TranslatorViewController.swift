//
//  TranslatorViewController.swift
//  Demo
//
//  Created by 楷岷 張 on 2017/4/17.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit

class TranslatorViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var photoCollection: UICollectionView!
    
    var model:[testManModel] = [
        testManModel(name: "測試人員1", photo: "test1"),testManModel(name: "測試人員2", photo: "test2"),testManModel(name: "測試人員3", photo: "test3"),testManModel(name: "測試人員4", photo: "test4"),testManModel(name: "測試人員5", photo: "test5"),testManModel(name: "測試人員6", photo: "test6")]
    
    let cellDetail = TranslatorCollectionViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       photoCollection.delegate = self
       photoCollection.dataSource = self
        
       
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TranslatorCollectionViewCell
        
        cell.nameLabel.text = model[indexPath.row].name
        cell.imageIndex.image = UIImage(named: model[indexPath.row].photo)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "requirement", bundle: nil)
        let TranslatorDetailViewController = storyboard.instantiateViewController(withIdentifier: "TranslatorDetailViewController") as! TranslatorDetailViewController
        TranslatorDetailViewController.photoName = model[indexPath.row].photo
        TranslatorDetailViewController.Name = model[indexPath.row].name
    
        navigationController?.pushViewController(TranslatorDetailViewController, animated: true)
    }

}
