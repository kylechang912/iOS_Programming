//
//  ViewController.swift
//  MyBooks
//
//  Created by Chang Chan Woo on 22/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    var database: DatabaseReference!
    // var books: [DataSnapshot]! = []
    var books: [String:[String:String]]! = [:]
    var databaseHandler: DatabaseHandle!
    let databaseName: String = "books"
    let cellIdentifier = "bookCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let booksArray = Array(self.books)
        let book = booksArray[indexPath.row]
        cell.textLabel?.text = book.value["title"]
        cell.detailTextLabel?.text = book.value["author"]
        
        return cell
    }
    
    func configureDatabase() {
        database = Database.database().reference()
        databaseHandler = database.child(databaseName)
            .observe(.value, with: { (snapshot) -> Void in
                guard let books = snapshot.value as? [String:[String:String]]
                    else {
                        return
                }
                /*
                 self.books.append(snapshot)
                 if let dictionary = snapshot.value as? [String:String] {
                 let title = dictionary["title"]
                 print(title!)
                 }
                 print("새로운 책이 추가되었습니다. 총 개수: \(self.books.count)")
                 })
                 }
                 */
                self.books = books
                self.tableView.reloadData()
                print("책의 개수가 변동되었습니다")
                print("총 개수: \(self.books.count)")
            })
    }
    
    func addNewBook(_ title:String, author: String, publisher: String) {
        let newBook: [String:String]
        newBook = ["title":title,
                   "author":author,
                   "publisher":publisher]
        database.child(databaseName).childByAutoId().setValue(newBook)
    }
    
    @IBAction func touchUpAddButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "책 정보 입력",
                                      message: "정보를 입력하세요",
                                      preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "책 제목"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "저자"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "출판사"
        }
        let cancelAction = UIAlertAction(title: "취소",
                                         style: .cancel,
                                         handler: nil)
        let okAction = UIAlertAction(title: "확인",
                                     style: .default) { (action) in
            let title = alert.textFields![0].text!
            let author = alert.textFields![1].text!
            let publisher = alert.textFields![2].text!
            self.addNewBook(title, author: author, publisher: publisher)
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let booksArray = Array(self.books)
            let book = booksArray[indexPath.row]
            self.books.removeValue(forKey: book.key)
            database.child(databaseName).removeValue()
            tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatabase()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController
            else {
                return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell
            else {
                return
        }
        guard let indexPath: IndexPath = tableView.indexPath(for: cell)
            else {
                return
        }
        let booksArray = Array(self.books)
        let book = booksArray[indexPath.row]
        nextViewController.book = book.value
    }
}
