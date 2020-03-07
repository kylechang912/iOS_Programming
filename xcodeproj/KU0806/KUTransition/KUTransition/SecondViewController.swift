//
//  SecondViewController.swift
//  KUTransition
//
//  Created by Chang Chan Woo on 05/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var label: UILabel!

    // 메모리에 뷰가 생겨났을 때 실행될 함수
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.label?.alpha = 0
        
        self.view.backgroundColor = UIColor.gray
        print("view did load")
        // Do any additional setup after loading the view.
    }
    
    // 뷰가 보여지기 직전에 실행될 함수
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
        print("view will appear")
    }
    
    // 뷰가 완전히 보여진 이후에 실행될 함수
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 3.0) {
            self.label?.alpha = 1
        }
        print("view did appear")
    }
    
    @IBAction func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
