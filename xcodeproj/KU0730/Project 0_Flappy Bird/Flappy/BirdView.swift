//
//  BirdView.swift
//  Flappy
//
//  Created by Chang Chan Woo on 26/07/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class BirdView: UIImageView {

    var name = "짹쨱이"
    
    @IBAction func moveUp() {
        print("\(name)이가 위로 날아")
        if self.frame.origin.y > 0  {
            self.frame.origin.y -= 30
        }
    }

    @IBAction func moveRight() {
        print("\(name)이가 오른쪽으로 움직여")
        let viewWidth = superview!.frame.size.width
        let width = self.frame.size.width
        
        if viewWidth - width >= self.frame.origin.x {
            self.frame.origin.x += 30
        }
    }
    
    @IBAction func moveLeft() {
        print("\(name)이가 왼쪽으로 날아")
        if self.frame.origin.x > 0 {
            self.frame.origin.x -= 30
        }
    }
    
    @IBAction func moveDown() {
        print("\(name)이가 아래로 움직여")
        let viewHeight = superview!.frame.size.height
        let height = self.frame.size.height
        
        if viewHeight - height >= self.frame.origin.y {
            self.frame.origin.y += 30
        }
    }
}
