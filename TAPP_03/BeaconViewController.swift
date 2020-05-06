/*
import UIKit
import CoreLocation

class BeaconViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

      var locationManager = CLLocationManager()
               locationManager.delegate = self as? CLLocationManagerDelegate
               locationManager.requestAlwaysAuthorization()
           
       func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           if status == .authorizedAlways {
               if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                   if CLLocationManager.isRangingAvailable() {
                       startScanning()
                       //Funktionen her tjekker om man har autoritet til at bruge user location
                                   }
               }
           }
       }
           func startScanning() {
               let uuid = UUID(uuidString: "UUID på iBeacon")!
               let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 123, minor: 456, identifier: "MyBeacon") //Her skal der indsættes data for hvilke major, minor og identifiter egenskaber til vores beacon

               locationManager.startMonitoring(for: beaconRegion)
               locationManager.startRangingBeacons(in: beaconRegion)
       }
           
           func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
               if beacons.count > 0 {
                   updateDistance(beacons[0].proximity)
               } else {
                   updateDistance(.unknown)
               }
           }

           func updateDistance(_ distance: CLProximity) {
               UIView.animate(withDuration: 0.8) {
                   switch distance {
                   case .unknown:
                       self.view.backgroundColor = UIColor.gray

                   case .far:
                       self.view.backgroundColor = UIColor.blue

                   case .near:
                       self.view.backgroundColor = UIColor.orange

                   case .immediate:
                       self.view.backgroundColor = UIColor.red
                   }
               }
           }
    }
}
*/
