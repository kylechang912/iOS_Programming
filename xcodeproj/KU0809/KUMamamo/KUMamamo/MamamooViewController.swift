//
//  MamamooViewController.swift
//  KUMamamo
//
//  Created by Chang Chan Woo on 09/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class MamamooViewController: UIViewController {

    @IBOutlet var titlesLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var realNameLabel: UILabel!
    @IBOutlet var yearOfBirthLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    
    var mamamooJson: MamamooInfo!
    var mamamooMembersJson: MamamooMembersInfo!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = mamamooJson.name
        titlesLabel.text = mamamooJson.titles
        
        realNameLabel.text = mamamooMembersJson.realName
        yearOfBirthLabel.text = mamamooMembersJson.yearOfBirth
        positionLabel.text = mamamooMembersJson.position
        
        let image = UIImage(named: mamamooMembersJson.imageName)
        
         imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
