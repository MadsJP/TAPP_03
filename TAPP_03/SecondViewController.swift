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
    var ref: DatabaseReference!
  
   
    //locationManager: CLLocationManager = CLLocationManager()



   override func viewDidLoad() {
                super.viewDidLoad()
   // Update one field, creating the document if it does not exist.
                ref = Database.database().reference()
                locationManager = CLLocationManager()
                locationManager.delegate = self
                locationManager.requestWhenInUseAuthorization()
                mapView.showsUserLocation = true
            }

            func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
                if status != .authorizedWhenInUse {return}
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.startUpdatingLocation()
                let locValue: CLLocationCoordinate2D = manager.location!.coordinate
                let lat = locValue.latitude
                let long = locValue.longitude
                print("Latitude = \(lat) Longtitude =\(long)")
                
            }
           
        }







        /*
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
      
        mapView.showsUserLocation = true
        
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                     let locValue: CLLocationCoordinate2D = manager.location!.coordinate
                     print("locations = \(locValue.latitude) \(locValue.longitude)")
                 }
        
        
       
        // Do any additional setup after loading the view.
    }


}
*/
//HEJ
