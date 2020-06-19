//
//  SecondViewController.swift
//  TAPP_03
//
//  Created by Mads Janner Pedersen on 06/05/2020.
//  Copyright © 2020 Mads Janner Pedersen. All rights reserved.
////https://www.youtube.com/watch?v=WPpaAy73nJc

import UIKit
import MapKit
import CoreLocation

class SecondViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    fileprivate let locationManager: CLLocationManager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
       
        // Do any additional setup after loading the view.
    }


}

//HEJ
