//
//  main.swift
//  KUOptional
//
//  Created by Chang Chan Woo on 06/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var weight: Double? = nil
    var room: Apartment?
    
    // initializer로 클래스로 만들어주는 공장
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var roomNumber: Int
    var resident: Person?
    
    init(room: Int) {
        self.roomNumber = room
    }
}


let kyle: Person = Person(name: "Kyle")
let harry: Person = Person(name: "Harry")

let towerPalace: Apartment = Apartment(room: 101)

kyle.room = towerPalace
towerPalace.resident = kyle

if let room = kyle.room {
    print("\(kyle.name)의 집은 \(room.roomNumber)호입니다.")
}

kyle.room = nil
towerPalace.resident = nil

if let room = kyle.room {
    print("\(kyle.name)의 집은 \(room.roomNumber)호입니다.")
} else {
    print("집 없음.")
}

let weight: Double? = kyle.room?.resident?.weight
let name: String? = kyle.room?.resident?.name

print(weight, name)

/*
 if let weight: Double? = kyle.room?.resident?.weight {
 print(addressNumber)
 }
*/

