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

        // Do any additional setup after loading the view.
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let newCharacterName = characterTextField.text {
            character = newCharacterName
        }
    }
    
   

}
