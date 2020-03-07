//
//  MamamooInfo.swift
//  KUMamamo
//
//  Created by Chang Chan Woo on 09/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class MamamooInfo: NSObject, Codable {

    var name: String
    var members: [MamamooMembersInfo]
    var titles: String
}

class MamamooMembersInfo: NSObject, Codable {
    var name: String
    var yearOfBirth: String
    var realName: String
    var position: String
    var imageName: String
}
