//
//  SecondViewController.swift
//  Project 2_ SignUp
//
//  Created by Chang Chan Woo on 06/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var idField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var passwordRecheckField: UITextField!
    @IBOutlet var selfIntroduceField: UITextView!
    @IBOutlet var nextButton: UIButton!
    
    var wasImageSelected: Bool = false
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        return picker
    }()
    
    @IBAction func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func textFieldTextEdited (_ sender: UITextField) {
        determineButtonState()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        determineButtonState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selfIntroduceField.delegate = self
    }
    
    @IBAction func touchUpSelectImageTapView(_ sender: UITapGestureRecognizer) {
        self.present(self.imagePicker, animated: true, completion: nil)
        print("Tapped")
    }
    
    // 사용자가 Image Picker을 통해 Image 선택했을 때
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage: UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = selectedImage
            wasImageSelected = true
            determineButtonState()
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    // 사용자가 Image Picker에서 Image 선택을 취소했을 때
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func determineButtonState() {
        if wasImageSelected == true,
            let id: String = idField.text,
            id.count > 0,
            let password: String = passwordField.text,
            password.count > 0,
            let passwordRecheck: String = passwordRecheckField.text,
            password == passwordRecheck,
            let selfIntroduce: String = selfIntroduceField.text,
            selfIntroduce.count > 0 {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserInformation.shared.id = idField.text
    }
    
}
