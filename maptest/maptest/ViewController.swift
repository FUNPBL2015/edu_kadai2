//
//  ViewController.swift
//  maptest
//
//  Created by Yuto Kumagai on 2015/05/20.
//  Copyright (c) 2015年 Yuto Kumagai. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var MyMapView: MKMapView!
    var myLocationManager: CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.MyMapView?.delegate = self
        
        var region:MKCoordinateRegion = self.MyMapView!.region
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(41.842011,140.766987)
        region.center = location
        region.span.latitudeDelta = 0.005
        region.span.longitudeDelta = 0.005
        
        self.MyMapView!.setRegion(region,animated:true)
        
        myLocationManager = CLLocationManager()
        
        myLocationManager.delegate = self
        myLocationManager.distanceFilter = kCLHeadingFilterNone
        myLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        myLocationManager.startUpdatingLocation()
        
        var myPin: MKPointAnnotation = MKPointAnnotation()
        myPin.coordinate = location
        myPin.title = "公立はこだて未来大学"
        myPin.subtitle = "亀田中野町116番地2"
        MyMapView.addAnnotation(myPin)
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations:[AnyObject]!) {
        MyMapView.showsUserLocation = true
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        if pinView == nil{
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            pinView!.pinColor = .Purple
            
            var rightButton: AnyObject! = UIButton.buttonWithType(UIButtonType.DetailDisclosure)
            pinView!.rightCalloutAccessoryView = rightButton as? UIView
        }
        else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    func mapView(mapView: MKMapView!, annotationView: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
         performSegueWithIdentifier("web",sender: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

