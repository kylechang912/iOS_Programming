//
//  Movie.swift
//  SearchMovie
//
//  Created by Chang Chan Woo on 21/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class MovieResponse: NSObject, Codable {
    // var lastBuildDate: String?
    var total: Int?
    // var start: Int?
    // var display: Int?
    var items: [Movie]?
}

class Movie: NSObject, Codable {
    var title: String?
    var link: String?
    var image: String?
    var subtitle: String?
    var pubDate: String?
    var director: String?
    var actor: String?
    var userRating: String?
}
