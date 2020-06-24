import UIKit
import EstimoteProximitySDK
import UserNotifications
import EstimoteBluetoothScanning
//EBSUniversalScannerDelegate
class FirstViewController: UIViewController, EBSUniversalScannerDelegate {
    var triggerdistance = 9.0
    @IBOutlet weak var beaconLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var indtastDist: UITextField!
    @IBOutlet weak var distLabel: UILabel!
    
    
    /*
    @IBAction func valueSent(_ sender: Any) {
        let text: String = indtastDist.text ?? "9.0"
        let text1 = Double(text) ?? 9.0
    }
    */
   
    
    
    @IBAction func pressedButton(_ sender: UIButton) {
        
        if let distanceStr = indtastDist.text {
            if let distance = Double(distanceStr){
                if (distance >= 1 && distance <= 40) {
                      triggerdistance = distance
                    print("Den er god")
                }
                else{
                   let alert = UIAlertController(title: "Forkert input", message: "Venligst skriv et tal mellem 1-40", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                    self.present(alert, animated: true)
                }
              
            }
            distLabel.text? = distanceStr + (" meter")
        }
        indtastDist.resignFirstResponder()
        
    }
    
    var proximityObserver: ProximityObserver!
    
    var proximityZones = [ProximityZone]()
    
    let estimoteCloudcredentials = CloudCredentials (appID: "tapp-03-o2f", appToken:  "8559dc75a4d97b0159356c6f259d5e7e") //Hentet fra estimote cloud TAPP_03 app
    
    
    let universalScanner = EBSUniversalScanner() //Muliggøre dataindsamling fra beacon
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        universalScanner.delegate = self
              universalScanner.startScanForDevicesRepresented(
                  byClasses: [EBSScanInfoEstimoteTelemetryA.self,
                              EBSScanInfoEstimoteTelemetryB.self])
        
        
        proximityObserver = ProximityObserver(credentials: estimoteCloudcredentials, onError: {error in
            print("Proximity error: \(error)")
        })
        
        defineProximityZones()
        
        if let proximityObserver = proximityObserver {
            print("proximity observer not nil: \(proximityObserver)")
            proximityObserver.startObserving(proximityZones)
        }
        else {
            print("proximity observer nil")
        }
        
        // Notifikation
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Permission granted")
            } else {
                if let error = error {
                    print(error.localizedDescription)
                }
            }
            
        }
        
  
    }
    
    
    
    
    func defineProximityZones() {
       // let distance = ""
        let zoneTagV = "Pen"
        let itemKey = "epi"
  
    
        
        let innerZone = ProximityZone(
            tag: zoneTagV,
            range: ProximityRange(desiredMeanTriggerDistance: triggerdistance ) ?? .far)

        innerZone.onEnter = {zoneContext in
        print("Hot!")
        self.logAction(message: "Entered \(zoneContext.tag)") }
        
        innerZone.onExit = {zoneContext in
        print("Colder...")
            self.notify()
        self.logAction(message: "Exited \(zoneContext.tag)") }
        
        
        
 
      /*  let outerZone = ProximityZone(
            tag: zoneTagV,
            range: ProximityRange(desiredMeanTriggerDistance: 9.0) ?? .far)
        
        outerZone.onEnter = {zoneContext in
        print("Warmer...")
        self.logAction(message: "Entered \(zoneContext.tag)") }
        
        outerZone.onExit = {zoneContext in
        print("Freezing")
        self.logAction(message: "Exited \(zoneContext.tag)") }
        */
        innerZone.onContextChange = { contexts in
                    print("Context")
                    let itemsChanged = contexts.map { contexts in
                        contexts.attachments[itemKey]
                    }
                    let items = itemsChanged.compactMap {$0}
                    
                    if !items.isEmpty {
                 
                 
                        self.logAction(message: "Du er tæt på: \(zoneTagV) med \(items)")
                
            
                
                    }
                }
             
                proximityZones.append(innerZone)
         
            }
    
            
            func logAction(message: String){
                print(message)
                
                beaconLabel.text = message
            }
    
    // Notifikation denne skal kaldes on exit
    
    func notify() {
        let content = UNMutableNotificationContent()
        
        content.title = "Hej [Bruger] "
        content.body = "Husk din Epipen"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let reguestIdentifier = "request101"
        let request = UNNotificationRequest(identifier: reguestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    
    // Til temp
    func universalScanner (_ universalScanner: EBSUniversalScannerProtocol,
                           didScanEstimoteDevice scanInfo: EBSScanInfo) {
            //if let scanInfo = scanInfo as? EBSScanInfoEstimoteTelemetryA {
                //print("telemetry A detected")
                //print("beacon short ID = \(scanInfo.shortIdentifier)")
                //print("beacon in motion = \(scanInfo.motionState)")
           // }
            if let scanInfo = scanInfo as? EBSScanInfoEstimoteTelemetryB {
               // print(Date())
                print("telemetry B detected")
               // print("beacon short ID = \(scanInfo.shortIdentifier)")
               // print("temperature = \(scanInfo.temperatureInCelsius)")
                tempLabel.text = ("Temperatur = \(scanInfo.temperatureInCelsius)")
               // print(scanInfo.batteryLevel)
                // batteryLabel.text = ("Udløbsdato = \(scanInfo.batteryVoltageInMillivolts)")
                if Double(truncating: scanInfo.temperatureInCelsius) <= 20.0 {
                    notifyTempMin()
                
                }
                
                if Double(truncating: scanInfo.temperatureInCelsius) >= 27.0 {
                                   notifyTempMax()
                }
                }
        
               
            
    }

        func universalScanner(_ universalScanner: EBSUniversalScannerProtocol,
                              didFailToScanWithError error: Error) {
            NSLog("scanner error: \(error)")
        }
    
    func notifyTempMin() {
            let content = UNMutableNotificationContent()
            
            content.title = "Hej [Bruger] "
            content.body = "Temperaturen på din Epipen er for kold "
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let reguestIdentifier = "request101"
            let request = UNNotificationRequest(identifier: reguestIdentifier, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                
            }
            
        }
        
        func notifyTempMax() {
               let content = UNMutableNotificationContent()
               
               content.title = "Hej [Bruger] "
               content.body = "Temperaturen på din Epipen er for varm"
               
               let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
               let reguestIdentifier = "request101"
               let request = UNNotificationRequest(identifier: reguestIdentifier, content: content, trigger: trigger)
               
               UNUserNotificationCenter.current().add(request) { (error) in
                   if let error = error {
                       print(error.localizedDescription)
                   }
                   
               }
               
           }
        
            
}
extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
