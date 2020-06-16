//
//  PenDetailViewController.swift
//  TAPP_03
//
//  Created by Mads Janner Pedersen on 15/06/2020.
//  Copyright © 2020 Mads Janner Pedersen. All rights reserved.
//

import UIKit

class PenDetailViewController: UIViewController {
   
    @IBOutlet weak var epiKnap: UIButton!
    @IBOutlet weak var glucaKnap: UIButton!
    
    
    @IBAction func pressedEpi(_ sender: Any) {
        print("Trykkede på Epi")
    }
    
    @IBAction func pressedGluca(_ sender: Any) {
        print("Trykkede på Gluca")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


