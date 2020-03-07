//
//  WeatherInfo.swift
//  Project 3_ WeatherToday
//
//  Created by Chang Chan Woo on 20/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class WeatherInfo: NSObject, Codable {
    var cityName: String?
    var state: Int?
    var celsius: Double?
    var rainfallProbability: Int?
    
    /*
    init(cityName: String, state: String, celsius: String, rainfallProbability: String) {
        self.cityName = cityName
        self.state = state
        self.celsius = celsius
        self.rainfallProbability = rainfallProbability
    }
    */
}
