//
//  main.swift
//  KUArray
//
//  Created by Chang Chan Woo on 07/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import Foundation

// Array - 배열 (리스트)

let myAge: Int = 0

var favoriteNumbers: [Int] = [1, 3, 4]
if favoriteNumbers.count > 1 {
    let third: Int = favoriteNumbers[1]
        print(third)
}
favoriteNumbers.append(5)
print(favoriteNumbers.count)
print(favoriteNumbers[0])
favoriteNumbers[0] = 100
print(favoriteNumbers[0])
print(favoriteNumbers)
favoriteNumbers.remove(at: 0)
print(favoriteNumbers)
favoriteNumbers.removeAll()
// optional (빈 Array일 수도 있기 때문에 ~ print(favoriteNumbers.first)는 경고 받음 / (print(favoriteNumbers.last)도 같은 맥락)

if let first: Int = favoriteNumbers.first {
    print(first)
}

// let zeroIndex: Int = favoriteNumbers[0] // removeAll된 상태이기 때문에 프로그램 종료

class Person {
    var name: String?
    var age: Int?
}

var friends: [Person] = []
let kyle: Person = Person()
friends.append(kyle)
friends.append(Person())

friends.removeLast()

// let firstName = friends[1].name

for friend in friends {
    print(friend.name)
}

for i in 0..<friends.count {
    print(friends[i].name)
}

// Dictionary [키의 타입:값의 타입] : 장점 - Key 지정 자유 ~ 단점 - Optional이 필수
var contacts: [String:String] =
    ["찬우":"01012341234", "카일":"01043214321"]

if let 찬우연락처 = contacts["찬우"] {
    print(찬우연락처)
}

contacts["찬위"] = "01011111111"

var classmates: [String:Int] =
    ["찬우":1, "카일":2, "찬위":3]

classmates.removeValue(forKey: "찬우")
classmates["찬우"] = nil
print(classmates)


var a: [Int:String] = [100:"백", 200:"이백", 300:"삼백"]
a[100] = "일백"
a[500] = "오백"
a[400] = "사백"
print(a)

// Any

var any: Any = 0
any = "abc"
any = 1.0

var another: Any = "aaa"
another = 1.5
// 타입 확인

if let value: Int = any as? Int,
    let aValue: Int = another as? Int {

    let result: Int = value + aValue
    print(result)
}

var anys: [Any] = [1, 3.5, "abc", 6]
if let value = anys[2] as? String {
    print(value)
}

var anyValues: [String:Any] = ["찬우":1, "카일":2, "찬위":"123"]

if let value: Int = anyValues["찬우"] as? Int {
    print(value * 100)
}
