//
//  ViewController.swift
//  MapKit
//
//  Created by miyazawaryohei on 2020/10/11.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var myMap: MKMapView!
    
    @IBOutlet var toolBar: UIToolbar!
    //ツールバーのTintColorの初期値
    var defaultColor:UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultColor = toolBar.tintColor
        //スケールを表示する
        myMap.showsScale = true
    }
//横浜みなとみらいの領域を表示する
    @IBAction func gotoSpot(_ sender: Any) {
        //緯度と経度
        let ido = 35.454954
        let keido = 139.6313859
        //中央に表示する座標
        let center = CLLocationCoordinate2D(latitude: ido, longitude: keido)
        //スパン（約2.22km×2.22kmの範囲)
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        //表示する領域
        let theRegion = MKCoordinateRegion(center: center, span: span)
        //領域の地図に表示する
        myMap.setRegion(theRegion, animated: true)
        
    }
    
    @IBAction func changedMapType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            //地図
            myMap.mapType = .standard
            myMap.camera.pitch = 0.0
            toolBar.tintColor = defaultColor
            toolBar.alpha = 1.0
        case 1:
            //衛星写真
            myMap.mapType = .satellite
            toolBar.tintColor = UIColor.black
            toolBar.alpha = 0.8
        case 2 :
            //写真＋地図（ハイブレッド）
            myMap.mapType = .hybrid
            toolBar.tintColor = UIColor.black
            toolBar.alpha = 0.8
        case 3:
            //地図
            myMap.mapType = .standard
            toolBar.tintColor = defaultColor
            toolBar.alpha = 1.0
            //3Dビュー
            myMap.camera.pitch = 70 //俯角（見下ろす角度）
            myMap.camera.altitude = 700 //標高
        default:
            break
        }
    }
    
    
}

