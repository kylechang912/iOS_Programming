//
//  main.swift
//  KU0729
//
//  Created by Chang Chan Woo on 29/07/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import Foundation

// 값을 저장할 공간 변수 & 상수 - var, let

var name: String = "Kyle"
var age: Int = 50
print(age)

age = 21

print(name)
print(age)

print("제 이름은 \(name)이고요, 나이는 \(age)입니다.")

// 상수
// let은 바꿀 수 가 없음
// Int = 정수 & Double = 실수 & Float = 실수 (더 작음)

let pi : Double = 3.141592
var radius : Double = 4.0

var area = pi * radius * radius
print(area)

radius = 6.5
area = pi * radius * radius
print(area)

/*
class Person {
    var name = "사람"
    var age = 23
    
    func selfIntroduce() {
        print("저는 \(age)살 \(name)입니다.")
    }
}

let kyle = Person.init()
kyle.name = "장찬우"
kyle.selfIntroduce()
*/

// 이름짓기
// 카멜케이스
// 변수이름, 상수	이름, 함수이름 - 소문자
// smallLetterCamelCase

// 타입이름 - 대문자
// BigLetterCamelCase

var a: Int = 100
var b: Int = 200

// if-else 조건문
if a < b {
    print("a는 b보다 작아요")
} else if a == b {
    print("a는 b랑 같아요")
} else {
    print("a는 b보다 커요")
}

b = 30

if a < b {
    print("a는 b보다 작아요")
} else if a == b {
    print("a는 b랑 같아요")
} else {
    print("a는 b보다 커요")
}

// 이름 & 나이를 변수로 갖는 Person 클래스를 작성해보세요.

class Person {
    var name: String = "Kyle"
    var age: Int = 23
    
    init() {
    }
}

let kyle: Person = Person.init()
kyle.age = 23
let harry: Person = Person.init()
harry.name = "Harry"

if 20 <= kyle.age && kyle.age < 30 {
    print("Kyle은 20대")
} else {
    print("Kyle은 20대가 아님")
}

if kyle.age < 20 || kyle.age > 29 {
    print("Kyle은 20대가 아님")
}

if kyle.age + harry.age > 100 {
    print("평균 50살 이상")
}
