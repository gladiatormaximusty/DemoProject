//
//  DetailViewController.swift
//  GoogleNapDemo
//
//  Created by 楷岷 張 on 2017/4/23.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit
import EventKit
import GoogleMaps
import GooglePlaces

class DetailViewController: UIViewController {
    
    
    var DetailContentNumber:LocationModel?
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBAction func setInEvent(_ sender: UIButton) {
        
            let dateForMatter = DateFormatter()
            dateForMatter.dateStyle = .short
            let startDate = dateForMatter.date(from: (DetailContentNumber?.startDate)!)
            let endDate = dateForMatter.date(from: (DetailContentNumber?.endDate)!)
            
            let eventStore = EKEventStore()
            eventStore.requestAccess(to: .event) { (granted:Bool, error:Error?) in
                if error != nil {
                    return
                } else if granted == true && error == nil {
                    let event = EKEvent(eventStore: eventStore)
                    event.title = (self.DetailContentNumber?.name)!
                    event.startDate = startDate!
                    event.location = self.DetailContentNumber?.location
                    event.endDate = endDate!
                    event.notes = self.DetailContentNumber?.detail
                    event.url = URL(string: (self.DetailContentNumber?.url)!)
                    let alarm = EKAlarm()
//                    event.addAlarm(EKAlarm)
                    
                    event.calendar = eventStore.defaultCalendarForNewEvents
                    try! eventStore.save(event, span: .thisEvent)
                }
        }
        let alert = UIAlertController(title: "加入成功", message: "此行程已成功加入行事曆", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
        
    }
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var detailContent: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        NotificationCenter.default.post(name: Notification.Name("arrayNumber"), object: nil, userInfo: ["number": DetailContentNumber!])
        
        
        
        let camera = GMSCameraPosition.camera(withLatitude: (DetailContentNumber?.coordinate.latitude)!, longitude: (DetailContentNumber?.coordinate.longitude)!, zoom: 16)
        
        mapView.camera = camera
        mapView.mapType = .normal
        
        let redIcon = UIImage(named: "redPin_btn")
        let marker = GMSMarker(position: (DetailContentNumber?.coordinate)!)
        let icon = redIcon
        marker.icon = icon
        marker.map = mapView
        
        detailContent.showsVerticalScrollIndicator = false
        detailContent.showsHorizontalScrollIndicator = false
        
        detailContent.isEditable = false
        
        detailContent.text = DetailContentNumber?.detail
        let image = UIImage(named: (DetailContentNumber?.image)!)
        showImage.image = image
        
        
   
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        detailContent.setContentOffset(.zero, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    

}
