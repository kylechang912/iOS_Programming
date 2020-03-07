//
//  WeatherTableViewCell.swift
//  Project 3_ WeatherToday
//
//  Created by Chang Chan Woo on 20/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var weatherImageView: UIImageView!
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var rainfallProbabilityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
