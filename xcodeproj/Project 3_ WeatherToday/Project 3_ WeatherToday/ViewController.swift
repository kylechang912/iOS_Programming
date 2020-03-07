//
//  ViewController.swift
//  Project 3_ WeatherToday
//
//  Created by Chang Chan Woo on 14/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var countryInfo: [CountryInfo] = [] // 데이터를 저장할 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            print("Data Asset Load Failed")
            return
        }
        
        let jsonData: Data = dataAsset.data
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            countryInfo = try decoder.decode([CountryInfo].self, from: jsonData)
        } catch {
            print("json decode failed" + error.localizedDescription)
        }
        print("Country Information \(countryInfo.count)개 로드됨")
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryTableViewCell
        let country: CountryInfo = countryInfo[indexPath.row]
        cell.textLabel?.text = country.koreanName
        if let flag = country.assetName {
            cell.imageView?.image = UIImage(named: "flag_" + flag)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController
            else {
                return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell
            else {
                return
        }
        guard let cellForInitials: IndexPath = tableView.indexPath(for: cell)
            else {
                return
        }
        nextViewController.countryTitle = cell.textLabel?.text
        nextViewController.countryInitial = countryInfo[cellForInitials.row].assetName
    }
}
