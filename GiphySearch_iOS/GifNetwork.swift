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
    
    func fetchGifs(searchTerm: String, completion: @escaping (_ response: GifArray?) -> Void) {
        // GET URL요청
        let url = URL(string: "https://api.giphy.com/v1/gifs/search?api_key=\(apiKey)&q=\(searchTerm)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error {
                
                print("Error fetching from Giphy: ", err.localizedDescription)
            }
            do {
                // 데이터를 Gif배열로 디코딩
                DispatchQueue.main.sync {
                    let object = try! JSONDecoder().decode(GifArray.self, from: data!)
                    completion(object)
                }
            }
            // print("Giphy Data: ", data as Any)
        }.resume()
    }
    
    // 쿼리항목을 기반으로 하는 메소드 구현.
    /*
     Returns a url with our API key and search term
     - Parameter searchTerm: The string to search gifs of
     - Returns: URL of search term & api key
     */
    
    func urlBulider(searchTerm: String) -> URL {
        
        let apikey = apiKey
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.giphy.com"
        components.path = "/v1/gifs/search"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apikey),
            URLQueryItem(name: "q", value: searchTerm),
            URLQueryItem(name: "limit", value: "1") ]
        
        return components.url!
        
    }
}
