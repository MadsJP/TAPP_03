//
//  IndstillingerViewController.swift
//  TAPP_03
//
//  Created by Mads Janner Pedersen on 10/06/2020.
//  Copyright © 2020 Mads Janner Pedersen. All rights reserved.
//

import UIKit

class IndstillingerViewController: UIViewController {
    
    @IBOutlet weak var SwitchBluetooth: UISwitch!
    
    
    @IBAction func lokalitet(_ sender: UISwitch) {
    }
    
    @IBAction func notifikation(_ sender: UISwitch) {
    }
    
    @IBAction func epi(_ sender: UISwitch) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Add Target for UISwitch
        func SwitchBluetooth(_ sender: UISwitch) {
        if (sender.isOn == true)
        {
            if let  url = URL.init(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            
        }
        else
        {
            let alert = UIAlertController(title: "Bluetooth activation", message: "Please turn on Bluetooth", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }
            }
        }
    }
}
        

        // Do any additional setup after loading the view
    
