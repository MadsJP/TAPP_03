//
//  PenDetailViewController.swift
//  TAPP_03
//
//  Created by Mads Janner Pedersen on 15/06/2020.
//  Copyright © 2020 Mads Janner Pedersen. All rights reserved.
//

import UIKit

class PenDetailViewController: UIViewController {
   
    //Outlets
    @IBOutlet weak var penpickerView: UIPickerView!
    @IBOutlet weak var valgtPen: UILabel!
    
    //Variable
    let data = ["Epi Pen","Glucagon Pen","Adrealin Pen","ALKJ Pen"]
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
    //        read from user defaults
                let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int
                if let row = savedRow  {
                    return row
                } else {
                    return penpickerView.numberOfRows(inComponent: 0)
                }
                
    //            return temperaturePicker.numberOfRows(inComponent: 0)/2
            }
        
        func saveSelectedRow(_ row: Int) {
    //        write to user defaults, som gemmer persistent data selvom appen bliver lukket ned.
            let defaults = UserDefaults.standard
            defaults.set(row, forKey: userDefaultsLastRowKey)
            defaults.synchronize()
        }
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















    
    /*
    let userDefaultsLastRowKey = "pen"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let row = initialPickerRow()
        penpickerView.selectRow(row, inComponent: 0, animated: false)
        pickerView(penpickerView, didSelectRow: row, inComponent: 0)
    }
    
    func initialPickerRow() -> Int{
//        read from user defaults
            let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int
            if let row = savedRow  {
                return row
            } else {
                return penpickerView.numberOfRows(inComponent: 0) / 2
            }
            
//            return temperaturePicker.numberOfRows(inComponent: 0)/2
        }
    
    func saveSelectedRow(_ row: Int) {
//        write to user defaults
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()
    }
    func displayConvertedTemperature(forRow row: Int) {
        let degreesCentigrade = penPicker.values[row]
        valgtPen.text = String(degreesCentigrade)
    }
    
}

extension PenDetailViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(penPicker.values[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperature(forRow: row)
        saveSelectedRow(row)
    }
    
    
}
    

*/
