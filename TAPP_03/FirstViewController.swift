//
//  FirstViewController.swift
//  TAPP_03
//
//  Created by Mads Janner Pedersen on 06/05/2020.
//  Copyright © 2020 Mads Janner Pedersen. All rights reserved.
//

import UIKit
import EstimoteProximitySDK

class FirstViewController: UIViewController {
    
    @IBOutlet weak var Afstand: UILabel!
    
    var proximityObserver: ProximityObserver!
    
    var proximityZones = [ProximityZone]()
    
    let estimoteCloudcredentials = CloudCredentials (appID: "tapp-03-o2f", appToken:  "8559dc75a4d97b0159356c6f259d5e7e")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        proximityObserver = ProximityObserver(credentials: estimoteCloudcredentials,  onError: {error in print("Proximity error observer")})
        
        defineProximityZones()
        
        if let proximityObserver = proximityObserver {
            proximityObserver.startObserving(proximityZones)
        }
        
        }
    func defineProximityZones() {
        
        let zoneTagV = "V section"
       // let zoneTagX = "X section"
        let itemKey = "TAPP"
        
        let zoneV = ProximityZone(tag: zoneTagV, range: ProximityRange(desiredMeanTriggerDistance: 0.5) ?? .near)
        
        zoneV.onEnter = {zoneContext in
            self.logAction(message: "Entered \(zoneContext.tag)")
        }
        
        zoneV.onExit = {zoneContext in
        self.logAction(message: "Exited \(zoneContext.tag)")
        }
        zoneV.onContextChange = { contexts in
            let itemsChanged = contexts.map { contexts in
                contexts.attachments[itemKey]
            }
            let items = itemsChanged.compactMap {$0}
            
            if !items.isEmpty {
                self.logAction(message: "In \(zoneTagV) by \(items)")
                }
            }
        
        proximityZones.append(zoneV)
      
        }
    
        
    func logAction(message: String){
        print(message)
    Afstand.text = message
    }
    
}

