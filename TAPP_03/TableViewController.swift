//
//  TableViewController.swift
//  TAPP_03
//
//  Created by Mads Janner Pedersen on 16/06/2020.
//  Copyright © 2020 Mads Janner Pedersen. All rights reserved.
//https://www.hackingwithswift.com/example-code/system/how-to-save-user-settings-using-userdefaults

import UIKit

class TableViewController: UITableViewController {
    
    let userDefaults = UserDefaults.standard
    //Oulets
    @IBOutlet weak var epiLabel: UILabel!
    @IBOutlet weak var forskLabel: UILabel!
    @IBOutlet weak var switchEpi: UISwitch!
    @IBOutlet weak var switchForsk: UISwitch!
    
    
    
    //Klargøring til at funktionen skal kunne aktivere epiløber tilstanden gemmer med userdefaults
    @IBAction func epiState(_ sender: Any) {
        userDefaults.set((sender as AnyObject).isOn, forKey: "epiSwitchValue")
        if switchEpi.isOn {
            epiLabel.text = ("Du er tilmeldt epiløber")
        } else {
            epiLabel.text = ("Du er frameldt epiløber")
        }
    }
    
    //Klargøring til at funktionen skal kunne aktivere forskningens tilstanden
    @IBAction func forskState(_ sender: Any) {
      userDefaults.set((sender as AnyObject).isOn, forKey: "forskSwitchValue")
        if switchForsk.isOn {
            forskLabel.text = ("Du er tilmeldt forskning")
        } else {
            forskLabel.text = ("Du er frameldt forskning")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchForsk.isOn = userDefaults.bool(forKey: "forskSwitchValue")
        switchEpi.isOn = userDefaults.bool(forKey: "epiSwitchValue")
    }


}
