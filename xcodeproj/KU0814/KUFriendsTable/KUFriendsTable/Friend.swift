//
//  Friend.swift
//  KUFriendsTable
//
//  Created by Chang Chan Woo on 14/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class Friend: NSObject, Codable {
    var name: String?
    var mobile: String?
    var age: Int?
    
    init(name: String, mobile: String, age: Int) {
        self.name = name
        self.mobile = mobile
        self.age = age
    }
    
}
