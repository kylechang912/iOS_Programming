//
//  ViewController.swift
//  SearchMovie
//
//  Created by Chang Chan Woo on 21/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit
import Alamofire // 서버에서 자료를 주고 받을 때 도와주는 친구

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var queryField: UITextField!
    let cellIdentifier = "movieCell"
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let movie: Movie = movies[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.subtitle
        
        return cell
    }
    
    
    @IBAction func touchUpSearchButton(_ sender: UIButton) {
        guard let query: String = queryField.text,
            query.isEmpty == false else {
                print("검색어를 입력해주세요")
                return
        }
        queryField.endEditing(true)
        search(query)
    }
    
    func search(_ query: String) {
        print("\(query)를 검색할 것 입니다")
        
        let clientID = "Dh3R2g4EIrbtci9b3uAD"
        let clientSecret = "yHBADrv5Gw"
        
        let headers: [String:String] = ["X-Naver-Client-Id": clientID, "X-Naver-Client-Secret": clientSecret]
        
        let urlString = "https://openapi.naver.com/v1/search/movie.json"
        let parameters: [String:Any] = ["query": query, "display": 50]
        
        let request = Alamofire.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers)
        
        request.response { (dataResponse) in
            print(dataResponse.error)
            
            guard let data: Data = dataResponse.data else {
                print("no data")
                return
            }
            
            let decoder: JSONDecoder = JSONDecoder()
            
            do {
                let response: MovieResponse
                response = try decoder.decode(MovieResponse.self, from: data)
                if let items: [Movie] = response.items {
                    self.movies = items
                    print("\(items.count)개의 영화 로드됨")
                }
            } catch {
                print(error.localizedDescription)
            }
            self.tableView.reloadData()
        }
    }
}
