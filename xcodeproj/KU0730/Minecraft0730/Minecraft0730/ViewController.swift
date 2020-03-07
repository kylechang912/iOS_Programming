//
//  ViewController.swift
//  Minecraft0730
//
//  Created by Chang Chan Woo on 30/07/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

var stepsToMove: Int = 0

class Hero : UIView {
    var name: String = "Alex"
    
    @objc func moveDown() {
        for _ in 0..<stepsToMove {
            // if self.frame.origin.y + self.frame.size.height < self.frame.~~~? { mainViewHeight {print("\(self.name)이가 아래로 갑니다") self.frame.origin.y +=30}
        self.frame.origin.y += 30
        }
    }
    
    @objc func moveUp() {
        for _ in 0..<stepsToMove {
        self.frame.origin.y -= 30
        }
    }
    
    @objc func moveRight() {
        for _ in 0..<stepsToMove {
        self.frame.origin.x += 30
        }
    }
    
    @objc func moveLeft() {
        for _ in 0..<stepsToMove {
        self.frame.origin.x -= 30
        }
    }
}

class ViewController: UIViewController {

    let alex: Hero = Hero()
    let stepper: UIStepper = UIStepper()
    let numberLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.green
        
        let mainViewSize: CGSize = self.view.frame.size
        
        self.alex.backgroundColor = UIColor.brown
        self.alex.frame = CGRect(x: 0, y: 0, width: mainViewSize.width / 5,
                                             height: mainViewSize.height / 8)
        self.view.addSubview(self.alex)
        
        let downButton: UIButton = UIButton(type:
            UIButton.ButtonType.system)
        downButton.setTitle("DOWN", for : UIControl.State.normal)
        downButton.addTarget(alex,
                           action: #selector(alex.moveDown),
                           for: UIControl.Event.touchUpInside)
        
        let upButton: UIButton = UIButton(type:
            UIButton.ButtonType.system)
        upButton.setTitle("UP", for : UIControl.State.normal)
        upButton.addTarget(alex,
                             action: #selector(alex.moveUp),
                             for: UIControl.Event.touchUpInside)
        
        let rightButton: UIButton = UIButton(type:
            UIButton.ButtonType.system)
        rightButton.setTitle("RIGHT", for : UIControl.State.normal)
        rightButton.addTarget(alex,
                             action: #selector(alex.moveRight),
                             for: UIControl.Event.touchUpInside)
     
        let leftButton: UIButton = UIButton(type:
            UIButton.ButtonType.system)
        leftButton.setTitle("LEFT", for : UIControl.State.normal)
        leftButton.addTarget(alex,
                             action: #selector(alex.moveLeft),
                             for: UIControl.Event.touchUpInside)
        
        
        self.numberLabel.text = "0"
        self.numberLabel.textColor = UIColor.red
        
        self.stepper.value = 0
        self.stepper.minimumValue = 0
        self.stepper.isContinuous = false
        self.stepper.stepValue = 1
        self.stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: UIControl.Event.valueChanged)
        
        let upperStack : UIStackView =
            UIStackView(arrangedSubviews: [numberLabel, stepper])
        upperStack.alignment = UIStackView.Alignment.center
        upperStack.axis = .horizontal
        upperStack.distribution = .fillEqually
        upperStack.spacing = 8
        upperStack.frame = CGRect(x: 0,
                              y: mainViewSize.height - 88,
                              width: mainViewSize.width,
                              height: 44)
        self.view.addSubview(upperStack)
        
        
        let hStack: UIStackView = UIStackView(arrangedSubviews: [downButton, upButton, leftButton, rightButton])
        hStack.alignment = UIStackView.Alignment.center
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        hStack.spacing = 8
        hStack.frame = CGRect(x: 0,
                              y: mainViewSize.height - 44,
                              width: mainViewSize.width,
                              height: 44)
        self.view.addSubview(hStack)
        
    }
    
    @objc func stepperValueChanged(_ sender: UIStepper) {
        stepsToMove = Int(sender.value)
        self.numberLabel.text = "\(stepsToMove)"
        
    }
}
