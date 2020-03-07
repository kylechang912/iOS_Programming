//
//  ViewController.swift
//  KUFriendsTable
//
//  Created by Chang Chan Woo on 14/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var friends: [Friend] = []
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            print("Data Asset Load Failed")
            return
        }
        
        let jsonData: Data = dataAsset.data
        let decoder: JSONDecoder = JSONDecoder()
        
        do {
            // json 파일이 배열 형태이기 때문에 불러오는 Friend 역시 배열로 가지고 옴
            friends = try decoder.decode([Friend].self, from: jsonData)
        } catch {
            print("json decode failed" + error.localizedDescription)
        }
        print("친구 \(friends.count)명 로드됨")
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendTableViewCell
        
        let friend: Friend = friends[indexPath.row]
        // cell.textLabel?.text = friend.name
        cell.nameLabel.text = friend.name
        cell.mobileLabel.text = friend.mobile
        if let age = friend.age {
            cell.ageLabel.text = "\(age)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            friends.remove(at: indexPath.row)
            tableView.reloadSections(IndexSet(indexPath.section...indexPath.section), with: UITableView.RowAnimation.automatic)
        }
    }
}

