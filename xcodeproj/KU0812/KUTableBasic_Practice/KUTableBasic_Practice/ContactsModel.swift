//
//  ContactsModel.swift
//  KUTableBasic
//
//  Created by Chang Chan Woo on 12/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var mobile: String
    
    init(name: String, mobile: String) {
        self.name = name
        self.mobile = mobile
    }
}

class ContactsModel: NSObject {
    
    var friends: [Person ] = []
    
    override init() {
        super.init()
        
        friends.append(Person.init(name: "찬우", mobile: "1234"))
        friends.append(Person.init(name: "현준", mobile: "2234"))
        friends.append(Person.init(name: "명섭", mobile: "3234"))
        friends.append(Person.init(name: "호진", mobile: "4234"))
        friends.append(Person.init(name: "동우", mobile: "5234"))
        friends.append(Person.init(name: "승우", mobile: "6234"))
        friends.append(Person.init(name: "웅규", mobile: "7234"))
        friends.append(Person.init(name: "오윤", mobile: "8234"))
        friends.append(Person.init(name: "지은", mobile: "9234"))
        friends.append(Person.init(name: "동민", mobile: "10234"))
        friends.append(Person.init(name: "준우", mobile: "11234"))
        friends.append(Person.init(name: "원우", mobile: "12234"))
        
    }
}
