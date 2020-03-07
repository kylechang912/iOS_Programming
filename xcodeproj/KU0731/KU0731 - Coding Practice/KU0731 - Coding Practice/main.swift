//
//  main.swift
//  KU0731 - Coding Practice
//
//  Created by Chang Chan Woo on 31/07/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import Foundation

class DrinkPurchase {
    
    var balance: Int = 0
    var recordOfWhiskey: Int = 0
    var recordOfBeer: Int = 0
    var recordOfSoju: Int = 0
    
    func makePurchase() {
        while balance >= 10000 {
            balance -= 10000
            recordOfWhiskey += 1
        }
        while balance >= 5000 {
            balance -= 5000
            recordOfBeer += 1
        }
        while balance >= 2000 {
            balance -= 2000
            recordOfSoju += 1
        }
        print("Number of Whiskey : \(recordOfWhiskey)")
        print("Number of Beer : \(recordOfBeer)")
        print("Number of Soju : \(recordOfSoju)")
        print("Remaining Balance : \(balance)")
    }
}

let case1: DrinkPurchase = DrinkPurchase()
case1.balance = 39500
case1.makePurchase()
