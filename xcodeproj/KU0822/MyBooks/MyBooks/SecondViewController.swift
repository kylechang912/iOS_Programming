//
//  SecondViewController.swift
//  MyBooks
//
//  Created by Chang Chan Woo on 22/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class SecondViewController: ViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var publisherLabel: UILabel!
    
    var book: [String:String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = book["title"]
        authorLabel.text = book["author"]
        publisherLabel.text = book["publisher"]
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
