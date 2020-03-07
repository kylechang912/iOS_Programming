//
//  SecondViewController.swift
//  KURockPaperScissors
//
//  Created by Chang Chan Woo on 19/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class SecondViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tabBarItem.title = "\(String(format: "%.2f", wonRateInPercentage))"
        self.title = "Hi"
        
        loadGameResultsFromFile()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "gameHistory")  else {
            print("Data Asset Load Failed")
            return
        }
        let decoder: JSONDecoder = JSONDecoder()
        let jsonData: Data = dataAsset.data
        
        do {
            gameHistory = try decoder.decode([GameHistory].self, from: jsonData)
        } catch {
            print("json decode failed" + error.localizedDescription)
        }
        print("게임 결과 \(gameHistory.count)개 로드됨")
        tableView.reloadData()
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("gameHistory.json")
        do {
            try FileManager.default.removeItem(at: filePath)
            gameHistory.removeAll()
        } catch {
            print("reset 실패 " + error.localizedDescription)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GameResultTableViewCell
        let resultOfGame: GameHistory = gameHistory[indexPath.row]
        cell.resultLabel?.text = resultOfGame.result
        // cell.gameTimeLabel?.text = resultOfGame.gameTime
        return cell
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

