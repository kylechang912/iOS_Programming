//
//  ViewController.swift
//  KUTableBasic_Practice
//
//  Created by Chang Chan Woo on 12/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    let defaultCellIdentifier = "cell"
    var model: ContactsModel = ContactsModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    // 테이블뷰 섹션 수를 return
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    // 특정 section에 해당하는 row의 수를 return
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return 10
        return model.friends.count
    }
    
    // 특정 IndecPath(section, row)에 해당하는 cell return
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier, for: indexPath)
        
        // cell.textLabel?.text = "\(indexPath.section) Section"
        // cell.detailTextLabel?.text = "\(indexPath.row) Row"
        
        let friend: Person = model.friends[indexPath.row]
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.mobile
        
        return cell
    }
}

