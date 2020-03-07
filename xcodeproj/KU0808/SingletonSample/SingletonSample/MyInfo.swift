//
//  MyInfo.swift
//  SingletonSample
//
//  Created by Chang Chan Woo on 08/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class MyInfo: NSObject {

    var name: String?
    var age: String? // textfield에서 받는 데이터는 숫자더라도 모두 String
    
    static let shared: MyInfo = MyInfo()
}
