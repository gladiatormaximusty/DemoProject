//
//  RecordTableViewController.swift
//  RegisterAndChatRoom
//
//  Created by 楷岷 張 on 2017/5/5.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit

class RecordTableViewController: UITableViewController {
    
    let demoRecord:[RecordMoedel]=[
        RecordMoedel(name: "Mr. Melon", image: "wizard4", pdfName: "報價單")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoRecord.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecordTableViewCell
        cell.consultantImage.layer.cornerRadius = cell.consultantImage.frame.width / 2
        cell.consultantImage.clipsToBounds = true
        cell.consultantImage.image = UIImage(named: demoRecord[indexPath.row].image!)
        cell.consultantName.text = demoRecord[indexPath.row].name
        cell.RecordName.text = demoRecord[indexPath.row].pdfName
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let showDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ShowDetailViewController") as! ShowDetailViewController
//        showDetailViewController.detailPDFName = demoRecord[indexPath.row].pdfName
        
        navigationController?.pushViewController(showDetailViewController, animated: true)
    }

    
    
}
