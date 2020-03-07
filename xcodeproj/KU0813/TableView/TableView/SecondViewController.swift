//
//  SecondViewController.swift
//  TableView
//
//  Created by Chang Chan Woo on 13/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class SecondViewController: ViewController {

    @IBOutlet var selectedLabel: UILabel!
    var text: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        selectedLabel.text = text
        // Do any additional setup after loading the view.
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
