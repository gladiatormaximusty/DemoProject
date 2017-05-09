//
//  RecordTableViewController.swift
//  RegisterAndChatRoom
//
//  Created by 楷岷 張 on 2017/5/5.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit

class RecordTableViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    @IBOutlet weak var leftButtonBackground: UIButton!
    @IBAction func leftButton(_ sender: UIButton) {
        sender.setImage(UIImage(named: "bsi_btn"), for: .normal)
        rightButtonBackground.setImage(UIImage(named: "push_mf_btn"), for: .normal)
        selectNmuber = 1
        
        showBusinessDetail.reloadData()
    }
    
    @IBOutlet weak var rightButtonBackground: UIButton!
    @IBAction func rightButton(_ sender: UIButton) {
        sender.setImage(UIImage(named: "mf_btn"), for: .normal)
        leftButtonBackground.setImage(UIImage(named: "push_bsi_btn"), for: .normal)
        
        selectNmuber = 2
        showBusinessDetail.reloadData()
    }
    
    var selectNmuber = 1
    
    
    @IBOutlet weak var showBusinessDetail: UICollectionView!
    let demoRecord:[RecordMoedel]=[
        RecordMoedel(name: "Mr. Melon", image: "asean", pdfName: "東盟茶葉標準")
    ]
    
    let partners:[PartnersModel] = [
        PartnersModel(name: "Chaiyakarn Pack Co.,Ltd.", detail: "成為專業 產“Hornboy”品牌下所有塑料食品和飲料包裝的公司。 優質的產品適 於 ，咖啡，奶， 果搖粒果汁和食品包裝。可以根據需要提供圖形設計，標誌設計和打印產品。", phone: "087-546-6595", email: "hornboycup@gmail.com", url: "www.hornboycup.com", logoImage: "partners1"), PartnersModel(name: "SUGAHUT TRADING CO.,LTD", detail: "SUGAHUT TRADING CO.,LTD 擁有從中國進 商品超過10 的經驗，並根據消費者需求反應調整進 的政策。 主要進 對消費者健康有好處的飲品，並提供最經濟實惠的價格。", phone: "02-447-3395", email: "sugahutthai@hotmail.com", url: "www.sugahut.com", logoImage: "partners2")
    ]


    override func viewDidLoad() {
        super.viewDidLoad()

        showBusinessDetail.delegate = self
        showBusinessDetail.dataSource = self
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let layout = showBusinessDetail.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: view.frame.width - 24, height: (view.frame.width - 24) * 0.3)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 12, bottom: 0, right: 12)
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 14
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selectNmuber == 1 {
            return demoRecord.count
        } else {
            return partners.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RecordCollectionViewCell
        if selectNmuber == 1 {
            cell.backView.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
            cell.backView.layer.shadowOpacity = 5
            cell.backView.layer.shadowColor = UIColor.gray.cgColor
            cell.backView.layer.shadowRadius = 10.0
            cell.photoImage.image = UIImage(named: demoRecord[indexPath.row].image!)
            cell.detailLabel.isHidden = true
            cell.nameLabel.text = demoRecord[indexPath.row].pdfName
        } else {
            cell.backView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
            cell.backView.layer.shadowOpacity = 5
            cell.backView.layer.shadowColor = UIColor.gray.cgColor
            cell.backView.layer.shadowRadius = 10.0
            cell.detailLabel.isHidden = false
            cell.nameLabel.text = partners[indexPath.row].name
            cell.detailLabel.text = partners[indexPath.row].phone
            cell.photoImage.image = UIImage(named: partners[indexPath.row].logoImage!)
        }
        return cell
    }
 
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectNmuber == 1 {
            let showDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ShowDetailViewController") as! ShowDetailViewController
            
            navigationController?.pushViewController(showDetailViewController, animated: true)
        } else {
            let newShowDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "NewShowDetailViewController") as! NewShowDetailViewController
            newShowDetailViewController.imageName = partners[indexPath.row].logoImage
            newShowDetailViewController.selectName = partners[indexPath.row].name
            newShowDetailViewController.selectPhone = partners[indexPath.row].phone
            newShowDetailViewController.selectMail = partners[indexPath.row].email
            newShowDetailViewController.selectUrl = partners[indexPath.row].url
            newShowDetailViewController.selectDetail = partners[indexPath.row].detail
            
            navigationController?.pushViewController(newShowDetailViewController, animated: true)
        }

    }
    
    
    
    
}
