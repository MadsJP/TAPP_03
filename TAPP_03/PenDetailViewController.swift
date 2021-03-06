//
//  PenDetailViewController.swift
//  TAPP_03
//
//  Created by Mads Janner Pedersen on 15/06/2020.
//  Copyright © 2020 Mads Janner Pedersen. All rights reserved.
//Ians eksempel med Temperature Converter fra DTU learn.

import UIKit

class PenDetailViewController: UIViewController {
   
    //Outlets
    @IBOutlet weak var penpickerView: UIPickerView!
    @IBOutlet weak var valgtPen: UILabel!
    
    //Variable
    let data = ["Epi Pen","Glucagon Pen","Adrealin Pen","ALK Pen"]
    let userDefaultsLastRowKey = "pen"

    
     override func viewDidLoad() {
           super.viewDidLoad()
        penpickerView.dataSource = self
        penpickerView.delegate = self
        let row = initialPickerRow()
        penpickerView.selectRow(row, inComponent: 0, animated: false)
        pickerView(penpickerView, didSelectRow: row, inComponent: 0)
        
    }
     func initialPickerRow() -> Int{
    //        Indlæser fra user defaults
                let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int
                if let row = savedRow  {
                    return row
                } else {
                    return penpickerView.numberOfRows(inComponent: 0)/2
                }
            }
        
        func saveSelectedRow(_ row: Int) {
    //       skriver til userdefaults, som gemmer persistent data selvom appen bliver lukket ned.
            let defaults = UserDefaults.standard
            defaults.set(row, forKey: userDefaultsLastRowKey)
            defaults.synchronize()
        }
    // Viser hvilken pen ud fra hvilken row der er valgt. 
    func displayChosenPen(forRow row: Int) {
        let chosenPen = data[row]
        valgtPen.text = ("Din valgte pen: \(chosenPen)")
    }
}


extension PenDetailViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    
}
extension PenDetailViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           displayChosenPen(forRow: row)
           saveSelectedRow(row)
       }
    
    
    
}
