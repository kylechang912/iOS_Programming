//
//  ViewController.swift
//  SingletonSample
//
//  Created by Chang Chan Woo on 08/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var ageField: UITextField!
    @IBOutlet var nextButton: UIButton!
    
    func textField(_ textField : UITextField, shouldChangeCharactersIn rage: NSRange, replacementString string: String) -> Bool {
        determineButtonState()
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameField.delegate = self // 너의 일을 내가 처리해주겠다
        ageField.delegate = self // 너의 일을 내가 처리해주겠다
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        MyInfo.shared.name = nameField.text
        MyInfo.shared.age = ageField.text
        
    }
    
    func determineButtonState() {
        if let name: String = nameField.text,
            name.count > 0,
            let age: String = ageField.text,
            age.count > 0 {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = MyInfo.shared.name
        ageField.text = MyInfo.shared.age
        
        determineButtonState()
    }
}
