//
//  AlarmViewController.swift
//  TAPP_03
//
//  Created by Mads Janner Pedersen on 16/06/2020.
//  Copyright © 2020 Mads Janner Pedersen. All rights reserved.
//

import UIKit
import SafariServices

class AlarmViewController: UIViewController {
    
    @IBOutlet weak var videoKnap: UIButton!
    
    
    @IBAction func openVideo(_ sender: Any) {
        if let url = URL(string: "https://www.youtube.com/watch?v=I_izvAbhExY&list=PLi66xyZXHmztg5TPvqiMm9Ztof5zhiZwR") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
