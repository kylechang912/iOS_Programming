//
//  SecondViewController.swift
//  Project 3_ WeatherToday
//
//  Created by Chang Chan Woo on 20/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var weatherInfo: [WeatherInfo] = []
    var countryTitle: String?
    var countryInitial: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = self.countryTitle
        
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: countryInitial!) else {
            print("Data Asset Load Failed")
            return
        }
        
        let jsonData: Data = dataAsset.data
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            weatherInfo = try decoder.decode([WeatherInfo].self, from: jsonData)
        } catch {
            print("json decode failed" + error.localizedDescription)
        }
        print("Weather Information \(weatherInfo.count)개 로드됨")
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell: WeatherTableViewCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! WeatherTableViewCell
        let weather: WeatherInfo = weatherInfo[indexPath.row]
        if weather.state != nil {
            if weather.state == 10 {
                customCell.weatherImageView?.image = UIImage(named: "sunny")
            } else if weather.state == 11 {
                customCell.weatherImageView?.image = UIImage(named: "cloudy")
            } else if weather.state == 12 {
                customCell.weatherImageView?.image = UIImage(named: "rainy")
            } else {
                customCell.weatherImageView?.image = UIImage(named: "snowy")
            }
        }
        customCell.cityNameLabel.text = weather.cityName
        customCell.celsiusLabel.text = String("섭씨: \(weather.celsius!)")
        customCell.rainfallProbabilityLabel.text = String(weather.rainfallProbability!)
        return customCell
    }
}

