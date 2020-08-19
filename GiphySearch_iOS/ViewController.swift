//
//  ViewController.swift
//  GiphySearch_iOS
//
//  Created by junhyuk on 2020/08/18.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var gifTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        // Do any additional setup after loading the view.
    }
    
    // 델리게이트 패턴을 함수로 이용하여 코드 구현
    func setup() {
        
        gifTableView.dataSource = self
        gifTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }


}

