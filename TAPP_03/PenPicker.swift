//
//  PenPicker.swift
//  TAPP_03
//
//  Created by Mads Janner Pedersen on 18/06/2020.
//  Copyright © 2020 Mads Janner Pedersen. All rights reserved.
//

import Foundation
import UIKit

class PenPicker: NSObject {
    let values = (1...40).map {$0}
}

extension PenPicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
}
