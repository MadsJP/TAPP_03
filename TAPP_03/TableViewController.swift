//
//  TableViewController.swift
//  TAPP_03
//
//  Created by Mads Janner Pedersen on 16/06/2020.
//  Copyright © 2020 Mads Janner Pedersen. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let userDefaults = UserDefaults.standard
    //Oulets
    @IBOutlet weak var epiLabel: UILabel!
    @IBOutlet weak var forskLabel: UILabel!
    @IBOutlet weak var switchEpi: UISwitch!
    @IBOutlet weak var switchForsk: UISwitch!
    
    
    
    //Klargøring til at funktionen skal kunne aktivere epiløber tilstanden
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
*/
}
