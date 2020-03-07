//
//  ThirdViewController.swift
//  Project 2_ SignUp
//
//  Created by Chang Chan Woo on 06/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var telephoneTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet var signUpButton: UIButton!
    
    var datePickerDidChange: Bool = false
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        self.datePicker.maximumDate = Date()
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func telephoneTextFieldTextEdited (_ sender: UITextField) {
        determineSignUpButtonState()
    }
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        print("value changed")
        
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
        datePickerDidChange = true
        determineSignUpButtonState()
    }
    
    @IBAction func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goRoot() {
        UserInformation.shared.id = nil
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    func determineSignUpButtonState() {
        if let telephone: String = telephoneTextField.text,
            telephone.count > 0,
            datePickerDidChange == true {
            signUpButton.isEnabled = true
        } else {
            signUpButton.isEnabled = false
        }
    }

}
