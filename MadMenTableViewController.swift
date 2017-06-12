//
//  MadMenTableViewController.swift
//  UnwindSegue
//
//  Created by Erica Millado on 6/12/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class MadMenTableViewController: UITableViewController {
    
    var madMenCharacters: [String] = ["Joan Holloway", "Don Draper", "Roger Sterling", "Bertram Cooper", "Pete Campbell", "Peggy Olson"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return madMenCharacters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "madMenCell", for: indexPath)
        cell.textLabel?.text = madMenCharacters[indexPath.row]
        cell.imageView?.image = UIImage(named: "madMen")
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the selected object to the new view controller.
        if segue.identifier == "toAddNewCharacter" {
            
        }
        
    }
    
    @IBAction func unwindFromAddVC(_ sender: UIStoryboardSegue) {
        print("unwound!")
        
        if sender.source is AddCharacterViewController {
            if let senderVC = sender.source as? AddCharacterViewController {
                madMenCharacters.append(senderVC.character)
            }
            tableView.reloadData()
        }
    
    
    }

}
