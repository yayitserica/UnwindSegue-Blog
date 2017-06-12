//
//  AddCharacterViewController.swift
//  UnwindSegue
//
//  Created by Erica Millado on 6/12/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class AddCharacterViewController: UIViewController {
    
    @IBOutlet weak var characterTextField: UITextField!
    
    var character: String!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newCharacterName = characterTextField.text {
            character = newCharacterName
        }
    }
    

}
