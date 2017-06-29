//
//  ShowFrameCollectionViewController.swift
//  GoogleNapDemo
//
//  Created by 楷岷 張 on 2017/4/24.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit
import GoogleMaps


class ShowFrameCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var selectIndex:[LocationModel] = [
        LocationModel(name: "", startDate: "", endDate: "", image: "", changeColor: false, location: "", detail: "", url: "", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.showsHorizontalScrollIndicator = false
        self.collectionView?.showsVerticalScrollIndicator = false
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 110)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10) //item跟collocationView上下左右兼具
        layout.minimumInteritemSpacing = 20 //項目與項目的艱鉅
        layout.minimumLineSpacing = 20 //行宇航的艱鉅
        
        NotificationCenter.default.addObserver(self, selector: #selector(getDetailArray(Not:)), name: Notification.Name("displayDetail"), object: nil)
    }
    
    func getDetailArray(Not:Notification) {
        selectIndex.removeAll()
        if let showDetail = Not.userInfo?["selectorDetail"] as? [LocationModel] {
            selectIndex = showDetail
            print(showDetail.count)
        }
        collectionView?.reloadData()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return selectIndex.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShowFrameCollectionViewCell
            cell.backView.layer.cornerRadius = 5
            cell.backView.clipsToBounds = true
            cell.activityImage.image = UIImage(named: (selectIndex[indexPath.row].image))
            cell.activityDate.text = "\(selectIndex[indexPath.row].startDate)~\(selectIndex[indexPath.row].endDate)"
            cell.activityName.text = selectIndex[indexPath.row].name

        return cell
    }
    
//    開始轉換item頁面時會做的事情
//    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
////        print(taiwanActivity.testLocation[indexPath.row].name)
//        if testLocation[indexPath.row].changeColor == false {
//            testLocation[indexPath.row].changeColor = true
//            for i in 0...testLocation.count - 1 {
//                if testLocation[indexPath.row].coordinate.latitude == testLocation[i].coordinate.latitude && testLocation[indexPath.row].coordinate.longitude == testLocation[i].coordinate.longitude {
//                   testLocation[i].changeColor = true
//                }
//            }
//        }
//    }
//    
//    
////    當頁面轉換至下一個頁面時會做的事情
//    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        
//        print(testLocation[indexPath.row].name)
//        if testLocation[indexPath.row].changeColor == true {
//            testLocation[indexPath.row].changeColor = false
//            for i in 0...testLocation.count - 1 {
//                if testLocation[indexPath.row].coordinate.latitude == testLocation[i].coordinate.latitude && testLocation[indexPath.row].coordinate.longitude == testLocation[i].coordinate.longitude {
//                    testLocation[i].changeColor = false
//                }
//                print(testLocation[i].changeColor)
//            }
//                NotificationCenter.default.post(name: Notification.Name("redColor"), object: nil, userInfo: ["Bool": true])
//        }
//    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        DetailViewController.DetailContentNumber = selectIndex[indexPath.row]
        navigationController?.pushViewController(DetailViewController, animated: true)
    }
   
}
