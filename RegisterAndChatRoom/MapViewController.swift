//
//  ViewController.swift
//  GoogleNapDemo
//
//  Created by 楷岷 張 on 2017/4/20.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController, GMSMapViewDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var container: UIView!
    var exhibition:[Exhibition] = [
        Exhibition(coordinate: CLLocationCoordinate2D(latitude: 25.056697, longitude: 121.618117), select: false),Exhibition(coordinate: CLLocationCoordinate2D(latitude: 25.033358, longitude: 121.562206), select: false), Exhibition(coordinate: CLLocationCoordinate2D(latitude: 22.608432, longitude: 120.299201), select: false),Exhibition(coordinate: CLLocationCoordinate2D(latitude: 25.078641, longitude: 121.231105), select: false)
    ]
    
    var selectDetail:[LocationModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        建立一個地圖，camera是在設定起始看到的位置,zoom的數字越大地圖放越大
        let camera = GMSCameraPosition.camera(withLatitude: 23.65, longitude: 120.982024, zoom: 7.7)
        mapView.camera = camera
//        下面是地圖初始化會用到的方法
//        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
////        設定地圖顯示類型
        mapView.mapType = .normal
////        設定協助工具(還需測試，目前true跟false都沒有反應)
//        mapView.accessibilityElementsHidden = false
        mapView.delegate = self
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        container.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 19/255.0, green: 23/255.0, blue: 53/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 19/255.0, green: 23/255.0, blue: 53/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.tintColorDidChange()
        
        for i in 0...exhibition.count - 1 {
           inputLocationMarker(coordinate: exhibition[i].coordinate, changeColor: exhibition[i].select)
        }
        
    }

    
    func inputLocationMarker(coordinate: CLLocationCoordinate2D, changeColor:Bool) {
        
        switch changeColor {
        case true:
            let redIcon = UIImage(named: "redPin_btn")
            let marker = GMSMarker(position: coordinate)
            marker.icon = redIcon
            marker.map = mapView
            
        case false:
            let greenIcon = UIImage(named: "Greenpin_btn")
            let marker = GMSMarker(position: coordinate)
            marker.icon = greenIcon
            marker.map = mapView
        }
    }
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("點到地址")
    }
    
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        for i in exhibition {
            i.select = false
        }
        mapView.clear()
        for i in 0...exhibition.count - 1 {
            if exhibition[i].coordinate.latitude == marker.position.latitude && exhibition[i].coordinate.longitude == marker.position.longitude {
                exhibition[i].select = true
            }
             inputLocationMarker(coordinate: exhibition[i].coordinate, changeColor: exhibition[i].select)
        }
        selectDetail.removeAll()
        for x in testLocation {
            if x.coordinate.latitude == marker.position.latitude && x.coordinate.longitude == marker.position.longitude {
                selectDetail.append(x)
            }
        }
        container.isHidden = false
            NotificationCenter.default.post(name: Notification.Name("displayDetail"), object: nil, userInfo: ["selectorDetail":selectDetail, "switch": true])
        
        
        return false
    }
    
    func selectionIndex(coordinate: CLLocationCoordinate2D ,select:Bool) {
        
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("按到註釋")
    }
 
}

