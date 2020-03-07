//
//  CountryInfo.swift
//  Project 3_ WeatherToday
//
//  Created by Chang Chan Woo on 14/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class CountryInfo: NSObject, Codable {
    var koreanName: String?
    var assetName: String?
    
    // 여쭤보기
    init(koreanName: String, assetName: String) {
        self.koreanName = koreanName
        self.assetName = assetName
    }
}
