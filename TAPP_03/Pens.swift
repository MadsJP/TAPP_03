//  Created by Mads Janner Pedersen on 25/03/2020.
//  Copyright © 2020 Mads Janner Pedersen. All rights reserved.
//

import Foundation
import UIKit

class Pens {
    var name: String
    var manufactorer: String
    var image: UIImage
    
    init?(name: String, manufactorer: String, image: UIImage? = UIImage(named: "EpiPen")){
        
        guard !name.isEmpty && !manufactorer.isEmpty else {
            return nil
        }
        guard let penImage = image else {
            return nil
        }
        
        self.name = name
        self.manufactorer = manufactorer
        self.image = penImage
    }
    
}
