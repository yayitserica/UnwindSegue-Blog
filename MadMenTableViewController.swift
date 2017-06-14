//
//  MadMenTableViewController.swift
//  UnwindSegue
//
//  Created by Erica Millado on 6/12/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit
import CoreData

class MadMenTableViewController: UITableViewController {
    
//    var madMenCharacters: [String] = ["Joan Holloway", "Don Draper", "Roger Sterling", "Bertram Cooper", "Pete Campbell", "Peggy Olson"]
    var characters: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    // MARK: - Core Data Fetch and Save
    
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Character", in: managedContext)!
        let character = NSManagedObject(entity: entity, insertInto: managedContext)
        character.setValue(name, forKey: "name")
        
        do {
            try managedContext.save()
            characters.append(character)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    //FETCH FROM CORE DATA
    func fetchData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Character")
        do {
            characters = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    

    // MARK: - Navigation
    
    @IBAction func unwindFromAddVC(_ sender: UIStoryboardSegue) {
        
        if sender.source is AddCharacterViewController {
            if let senderVC = sender.source as? AddCharacterViewController {
                //SAVE TO CORE DATA
                save(name: senderVC.character)
//                madMenCharacters.append(senderVC.character)
            }
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return madMenCharacters.count
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "madMenCell", for: indexPath)
//        cell.textLabel?.text = madMenCharacters[indexPath.row]
        cell.textLabel?.text = characters[indexPath.row].value(forKey: "name") as? String
        cell.imageView?.image = UIImage(named: "madMen")
        return cell
    }


}
