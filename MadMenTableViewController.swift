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

    @IBAction func unwindFromAddVC(_ sender: UIStoryboardSegue) {
        
        if sender.source is AddCharacterViewController {
            if let senderVC = sender.source as? AddCharacterViewController {
                madMenCharacters.append(senderVC.character)
            }
            tableView.reloadData()
        }
    }

}
