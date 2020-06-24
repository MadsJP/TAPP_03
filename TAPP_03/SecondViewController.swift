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
import FirebaseDatabase

class SecondViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    //var ref: DatabaseReference!
    var ref: DatabaseReference!
    let loggedInKey = "loggedIn"
    
   
    
    // @ 123456
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Update one field, creating the document if it does not exist.
        // ref = Database.database().reference()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        print("UserID \(delegate.userUID ?? "userId nil")")
        ref = Database.database().reference()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse {return}
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        let locValue: CLLocationCoordinate2D = manager.location!.coordinate
        
        // Lokalitetsværdier som evt skal gemmes i db?
        let lat = locValue.latitude
        let long = locValue.longitude
        print("Latitude = \(lat) Longtitude =\(long)")
        
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        // Gem brugerens lokation i databasen
        
        let uid = delegate.userUID
        //Databasekald 
        ref?.child("Users").child(uid! as String)
        ref?.child("Users").child(uid! as String).child("longitude").setValue(lat)
        ref?.child("Users").child(uid! as String).child("latitude").setValue(long)
        
    }
    
    
}
