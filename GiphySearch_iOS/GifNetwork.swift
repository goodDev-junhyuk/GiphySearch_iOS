//
//  GifNetwork.swift
//  GiphySearch_iOS
//
//  Created by junhyuk on 2020/08/20.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

class GifNetwork {
    
    // API키 설정.
    let apiKey = "8xX150rNY4eNF4dOqTe00XaYKxEVPyoR"
    
    func fetchGifs(searchTerm: String) {
        
        let url = URL(string: "https://api.giphy.com/v1/gifs/search?api_key=\(apiKey)&q=\(searchTerm)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error {
                
                print("Error fetching from Giphy: ", err.localizedDescription)
            }
            print("Giphy Data: ", data as Any)
        }.resume()
    }
}
