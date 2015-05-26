//
//  ViewController.swift
//  2kai_kadai
//
//  Created by 新保遥平 on 2015/05/22.
//  Copyright (c) 2015年 Yohei Shinpo. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var myMapView: UIWebView!
   
    var myLocationManager: CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        myLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        myLocationManager.startUpdatingLocation()
        
        
        var myPin: MKPointAnnotation = MKPointAnnotation()
        myPin.coordinate = location
        myPin.title = "公立はこだて未来大学"
        myPin.subtitle = "亀田中野116番地2"
        myMapView.addAnnotation(myPin)
        
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations:[AnyObject]!) {
        
        
        myMapView.showsUserLocation = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

