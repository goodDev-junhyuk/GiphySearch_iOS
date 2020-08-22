//
//  ViewController.swift
//  GiphySearch_iOS
//
//  Created by junhyuk on 2020/08/18.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var network = GifNetwork()
    var gifs = [Gif]()
    
    // TableView 및 searchBar 프로퍼티 선언.
    @IBOutlet var gifTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    // 앱사이클
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        // Do any additional setup after loading the view.
    }
    
    // 델리게이트 패턴을 함수로 이용하여 코드 구현
    func setup() {
        gifTableView.dataSource = self
        gifTableView.delegate = self
        
        // searchBar 델리게이트 패턴 구현
        searchBar.searchTextField.delegate = self
        searchBar.searchTextField.placeholder = "가장 좋아하는 이미지는 무엇입니까?"
        searchBar.returnKeyType = .search
    }
    
    func searchGifs(for searchText: String) {
        
        network.fetchGifs(searchTerm: searchText) { gifArray in
            
            if gifArray != nil {
                print(gifArray!.gifs.count)
                self.gifs = gifArray!.gifs
                self.gifTableView.reloadData()
                
            }
        }
    }
}

// 테이블뷰에 관한 메소드 구현. 문서 참조.
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gifCell") as! GifCell
        
        return cell
        
    }
}

extension ViewController: UISearchTextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if textField.text != nil {
            
            searchGifs(for: textField.text!)
            // print(textField.text!)
        }
        return true
    }
}
