//
//  ViewController.swift
//  Project 2_ SignUp
//
//  Created by Chang Chan Woo on 06/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var idField: UITextField!
    
    override func viewDidLoad() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        idField.text = UserInformation.shared.id
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserInformation.shared.id = idField.text
    }
}
