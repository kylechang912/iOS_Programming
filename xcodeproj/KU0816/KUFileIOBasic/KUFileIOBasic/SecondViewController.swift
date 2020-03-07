//
//  SecondViewController.swift
//  KUFileIOBasic
//
//  Created by Chang Chan Woo on 16/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class SecondViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    
    // @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "contacts")  else {
            print("Data Asset Load Failed")
            return
        }
        let decoder: JSONDecoder = JSONDecoder()
        let jsonData: Data = dataAsset.data
        
        do {
            // json 파일이 배열 형태이기 때문에 불러오는 Friend 역시 배열로 가지고 옴
            contacts = try decoder.decode([ContactInfo].self, from: jsonData)
        } catch {
            print("json decode failed" + error.localizedDescription)
        }
        print("친구 \(contacts.count)명 로드됨")
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactTableViewCell
        
        let contact: ContactInfo = contacts[indexPath.row]
        cell.nameLabel?.text = contact.name
        cell.mobileLabel?.text = contact.mobile
        return cell
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */
