//
//  ViewController.swift
//  maptest
//
//  Created by 新保遥平 on 2015/05/20.
//  Copyright (c) 2015年 Yohei Shinpo. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var myMapView: MKMapView!
    var myLocationManager: CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myURL = NSURL(string:"http://www.fun.ac.jp/")
        
        
        self.myMapView?.delegate = self
        
        var region:MKCoordinateRegion = self.myMapView!.region
        var location:CLLocationCoordinate2D
        = CLLocationCoordinate2DMake(41.842011,140.766987)
        region.center = location
        region.span.latitudeDelta = 0.005
        region.span.longitudeDelta = 0.005
        
        self.myMapView!.setRegion(region, animated: true)
        
        myLocationManager = CLLocationManager()
        
        myLocationManager.delegate = self
        myLocationManager.distanceFilter = kCLHeadingFilterNone
        myLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        myLocationManager.startUpdatingLocation()
        
        var myPin: MKPointAnnotation = MKPointAnnotation()
        myPin.coordinate = location
        myPin.title = "公立はこだて未来大学"
        myPin.subtitle = "亀田中野町116番地2"
        
        myMapView.addAnnotation(myPin)
        
        // 長押しのUIGestureRecognizerを生成.
        var myLongPress: UILongPressGestureRecognizer = UILongPressGestureRecognizer()
        
        myLongPress.addTarget(self, action: "recognizeLongPress:")
        
        // MapViewにUIGestureRecognizerを追加.
        
        myMapView.addGestureRecognizer(myLongPress)
        
    }
    
    func recognizeLongPress(sender: UILongPressGestureRecognizer) {
        
        
        let url = "http://www.fun.ac.jp/"
        let targetURL = NSURL(string: url)
        UIApplication.sharedApplication().openURL(targetURL!)//Safariでとばす
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations:[AnyObject]!) {
        
        
        myMapView.showsUserLocation = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

