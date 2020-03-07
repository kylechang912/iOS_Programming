//
//  ViewController.swift
//  TableView
//
//  Created by Chang Chan Woo on 13/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    let defaultCellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    /*
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     return ""
     }
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.section), \(indexPath.row)"
        
        
        if indexPath.row == 0 {
            cell.backgroundColor = UIColor.init(red: 128.0/255.0, green: 220.0/255.0, blue: 150.0/255.0, alpha: 1)
        } else {
            cell.backgroundColor = UIColor.white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section % 2 == 0 {
            return 50
        } else {
            return 150
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section) Section의 \(indexPath.row) Row를 사용자가 선택함")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if indexPath.row % 2 == 0 {
            self.performSegue(withIdentifier: "ShowPink", sender: cell)
        }
        if indexPath.row % 2 != 0 {
            self.performSegue(withIdentifier: "ShowBlue", sender: cell)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let cell = sender as? UITableViewCell else {
            print("sender가 cell이 아님")
            return
        }
        
        guard let nextViewController = segue.destination as? SecondViewController else {
            print("목적지가 SecondViewController가 아닙니다")
            return
        }
        
        nextViewController.text = cell.textLabel?.text
    }
}
