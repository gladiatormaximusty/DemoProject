//
//  RecordTableViewController.swift
//  RegisterAndChatRoom
//
//  Created by 楷岷 張 on 2017/5/5.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit

class RecordTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var changeValue: UISegmentedControl!
    
    @IBAction func tabkeViewReload(_ sender: UISegmentedControl) {
        
        showBusinessDetail.reloadData()
    }
    @IBOutlet weak var showBusinessDetail: UITableView!
    let demoRecord:[RecordMoedel]=[
        RecordMoedel(name: "Mr. Melon", image: "wizard4", pdfName: "東盟茶葉標準")
    ]
    
    let partners:[PartnersModel] = [
        PartnersModel(name: "Chaiyakarn Pack Co.,Ltd.", detail: "成為專業 產“Hornboy”品牌下所有塑料食品和飲料包裝的公司。 優質的產品適 於 ，咖啡，奶， 果搖粒果汁和食品包裝。可以根據需要提供圖形設計，標誌設計和打印產品。", phone: "087-546-6595", email: "hornboycup@gmail.com", url: "www.hornboycup.com", logoImage: "partners1"), PartnersModel(name: "SUGAHUT TRADING CO.,LTD", detail: "SUGAHUT TRADING CO.,LTD 擁有從中國進 商品超過10 的經驗，並根據消費者需求反應調整進 的政策。 主要進 對消費者健康有好處的飲品，並提供最經濟實惠的價格。", phone: "02-447-3395", email: "sugahutthai@hotmail.com", url: "www.sugahut.com", logoImage: "partners2")
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        showBusinessDetail.delegate = self
        showBusinessDetail.dataSource = self
        changeValue.tintColor = UIColor(red: 19/255.0, green: 23/255.0, blue: 53/255.0, alpha: 1.0)
        


        
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if changeValue.selectedSegmentIndex == 0 {
            return demoRecord.count
        } else {
            return partners.count
        }
        
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecordTableViewCell
            if changeValue.selectedSegmentIndex == 0 {
                cell.consultantImage.layer.cornerRadius = cell.consultantImage.frame.width / 2
                cell.consultantImage.clipsToBounds = true
                cell.consultantImage.image = UIImage(named: demoRecord[indexPath.row].image!)
                cell.consultantName.isHidden = true
                cell.RecordName.text = demoRecord[indexPath.row].pdfName
            } else {
                cell.consultantImage.layer.cornerRadius = cell.consultantImage.frame.width / 2
                cell.consultantImage.clipsToBounds = true
                cell.consultantName.isHidden = false
                cell.RecordName.text = partners[indexPath.row].name
                cell.consultantName.text = partners[indexPath.row].phone
                cell.consultantImage.image = UIImage(named: partners[indexPath.row].logoImage!)
            }
        return cell
    }
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if changeValue.selectedSegmentIndex == 0 {
            let showDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ShowDetailViewController") as! ShowDetailViewController
            
            navigationController?.pushViewController(showDetailViewController, animated: true)
        } else {
            let partnersTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "PartnersTableViewController") as! PartnersTableViewController
            partnersTableViewController.imageName = partners[indexPath.row].logoImage
            partnersTableViewController.selectName = partners[indexPath.row].name
            partnersTableViewController.selectPhone = partners[indexPath.row].phone
            partnersTableViewController.selectMail = partners[indexPath.row].email
            partnersTableViewController.selectUrl = partners[indexPath.row].url
            partnersTableViewController.selectDetail = partners[indexPath.row].detail

            navigationController?.pushViewController(partnersTableViewController, animated: true)
        }
       
    }

    
    
}
