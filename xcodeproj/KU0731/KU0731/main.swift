//
//  main.swift
//  KU0731
//
//  Created by Chang Chan Woo on 31/07/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import Foundation

// Hero class 만들기
// Hero class 객체는...
// name 속성
// moveForward 함수로 앞으로 이동
// destory 함수로 무언가를 부숨

enum Color {
    case purple
    case green
    case yellow
    case blue
    case brown
    case black
}

enum Language {
    case korean
    case english
    case spanish
    case russian
}

enum Direction {
    case left, right
}

class Hero {
    
    var name: String = ""
    var hairColor: Color = Color.green
    var eyeColor: Color = Color.brown
    var ethnicity: Language = Language.korean

    
    // 앞으로 이동할 횟수인 steps 전달
    func moveForward(steps: Int) {
        /* 이렇게 하면 print문이 3번 찍히나 아래의 print문은 한번만 찍힘
        for _ in 1...steps {
            print("\(steps)만큼 앞으로 이동")
        }
        */
        for step in 1...steps {
            print("앞으로 \(step)만큼 이동")
        }
    }
    
    // 괄호 안에 잠깐 머무는 변수
    func destroy(something: String) {
        print("\(something)을 부숨")
    }
    
    func turn(direction: Direction, count: Int) {
        for _ in 1...count {
        print("\(direction)으로 방향 전환")
        }
    }
    
    func turnAround() {
        self.turn(direction: Direction.left , count: 2)
    }
    
    func meet(someone: Hero) {
        print("\(self.name)가 \(someone.name)을 만납니다.")
    }
        
    // class라는 template에서 실체화시켜주는 기능
    init(){
    }
}

let alex: Hero = Hero()
alex.name = "알렉스"
alex.hairColor = Color.black
alex.turnAround()
alex.moveForward(steps: 3)
alex.destroy(something: "벽돌")
alex.turn(direction: Direction.left, count: 3)

let steve: Hero = Hero()
steve.name = "스티브"
steve.hairColor = Color.blue
steve.turnAround()
steve.moveForward(steps: 4)
steve.destroy(something: "비행기")
steve.turn(direction: Direction.right, count: 2)
// print("\(self)가 \(someone.)을 만납니다.")일 때는, steve.meet(someone: alex) -> KU0731.Hero가 KU0731.Hero을 만납니다.
steve.meet(someone: alex)
