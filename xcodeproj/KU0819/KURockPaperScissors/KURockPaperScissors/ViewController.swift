//
//  ViewController.swift
//  KURockPaperScissors
//
//  Created by Chang Chan Woo on 19/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var winningRate: UILabel!
    @IBOutlet var scissor: UIButton!
    @IBOutlet var rock: UIButton!
    @IBOutlet var paper: UIButton!
    @IBOutlet var userChoice: UILabel!
    @IBOutlet var gameResultNotice: UILabel!
    @IBOutlet var computerChoice: UILabel!
    var gameHistory: [GameHistory] = []
    
    /*
     let dateFormatter: DateFormatter = {
     let formatter: DateFormatter = DateFormatter()
     formatter.dateStyle = .medium
     return formatter
     }()
     */
    
    var userChoiceInNumber = Int()
    @IBAction func rockSelectedByUser(_ sender: UIButton) {
        userChoice.text = "✊"
        userChoiceInNumber = 0
        randomChoice()
        gameStart()
        calculateWinningRate()
        let newHistory: GameHistory = GameHistory()
        newHistory.result = gameResultNotice.text
        newHistory.gameTime = Date()
        gameHistory.append(newHistory)
        saveResultToFile()
    }
    
    @IBAction func scissorSelectedByUser(_ sender: UIButton) {
        userChoice.text = "✌️"
        userChoiceInNumber = 1
        randomChoice()
        gameStart()
        calculateWinningRate()
        let newHistory: GameHistory = GameHistory()
        newHistory.result = gameResultNotice.text
        newHistory.gameTime = Date()
        gameHistory.append(newHistory)
        saveResultToFile()
    }
    
    @IBAction func paperSelectedByUser(_ sender: UIButton) {
        userChoice.text = "🖐"
        userChoiceInNumber = 2
        randomChoice()
        gameStart()
        calculateWinningRate()
        let newHistory: GameHistory = GameHistory()
        newHistory.result = gameResultNotice.text
        newHistory.gameTime = Date()
        gameHistory.append(newHistory)
        saveResultToFile()
    }
    
    func saveResultToFile() {
        let jsonData: Data
        let encoder: JSONEncoder = JSONEncoder()
        do {
            jsonData = try encoder.encode(gameHistory)
        } catch {
            print("encode 실패 " + error.localizedDescription)
            return
        }
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("gameHistory.json")
        
        do {
            try jsonData.write(to: filePath)
        } catch {
            print("write to path 실패 " + error.localizedDescription)
            return
        }
        print("저장 완료. 현재 저장된 게임 결과 수 : \(gameHistory.count)")
    }
    
    func loadGameResultsFromFile() {
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("gameHistory.json")
        let jsonData: Data
        do {
            jsonData = try Data(contentsOf: filePath)
        } catch {
            print("load data 실패 " + error.localizedDescription)
            return
        }
        let decoder: JSONDecoder = JSONDecoder()
        do {
            gameHistory = try decoder.decode([GameHistory].self, from: jsonData)
            print("파일에서 불러온 게임 결과 수: \(gameHistory.count)")
        } catch {
            print("decode json 실패 " + error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    var randomNumber = Int()
    func randomChoice() {
        randomNumber = Int(arc4random() % 3)
    }
    
    func gameStart() {
        
        switch(randomNumber) {
            
        case 0:
            computerChoice.text = "✊"
            if userChoiceInNumber == 0 {
                gameResultNotice.text = "비김"
                //   calculateWinningRate()
            } else if userChoiceInNumber == 1 {
                gameResultNotice.text = "짐"
                //   calculateWinningRate()
            } else {
                gameResultNotice.text = "이김"
                //   calculateWinningRate()
            }
            
        case 1:
            computerChoice.text = "✌️"
            if userChoiceInNumber == 0 {
                gameResultNotice.text = "이김"
                //   calculateWinningRate()
            } else if userChoiceInNumber == 1 {
                gameResultNotice.text = "비김"
                //   calculateWinningRate()
            } else {
                gameResultNotice.text = "짐"
                //   calculateWinningRate()
            }
            
        case 2:
            computerChoice.text = "🖐"
            if userChoiceInNumber == 0 {
                gameResultNotice.text = "짐"
                //   calculateWinningRate()
            } else if userChoiceInNumber == 1 {
                gameResultNotice.text = "이김"
                //   calculateWinningRate()
            } else {
                gameResultNotice.text = "비김"
                //   calculateWinningRate()
            }
        default:
            break
        }
    }
    
    
    var totalGameNumber: Int = 0
    var totalGameWon: Int = 0
    var wonRateInPercentage: Double = 0.00
    
    func calculateWinningRate() {
        if gameResultNotice.text == "이김" {
            totalGameNumber += 1
            totalGameWon += 1
        } else {
            totalGameNumber += 1
            totalGameWon += 0
        }
        wonRateInPercentage = Double(Double(totalGameWon) / Double(totalGameNumber) * 100)
        let wonRateInPercentageFinal = String(format: "%.2f", wonRateInPercentage)
        winningRate.text = "승률: \(wonRateInPercentageFinal)%"
        
    }
}
