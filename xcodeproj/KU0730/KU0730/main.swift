//
//  main.swift
//  KU0730
//
//  Created by Chang Chan Woo on 30/07/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import Foundation

// 반복문 - Loop

// 1 ~ 3까지 똑같은 코드를 실행할 것 입니다 ({} 안에 감싼 코드)

for _ in 1...3 {
        print("Blah Blah")
}

// 실행중인 횟수는 변수 number가 알려줄거에요
for number in 1...5 {
    if number % 2 == 0 {
        print("짝수")
    } else {
        print("홀수")
    }
}

var first: Int = 3
var last: Int = 7

for i in first...last {
    print(i)
}

last = 10

for i in first...last {
    print(i)
}

//미만 표시
for i in first..<last {
    print(i)
}
