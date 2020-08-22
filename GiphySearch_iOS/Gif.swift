//
//  Gif.swift
//  GiphySearch_iOS
//
//  Created by junhyuk on 2020/08/22.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit


// 구조체
struct GifArray: Decodable {
    
    // Gif 객체 배열 선언
    var gifs: [Gif]
    enum CodingKeys: String, CodingKey {
        
        case gifs = "data"
    }
}

struct Gif: Decodable {
    
    var gifSources: GifImages
    enum CodingKeys: String, CodingKey {
        
        case gifSources = "images"
    }
    
    func getGifURL() -> String {
        
        return gifSources.original.url
    }
}

struct GifImages: Decodable {
    
    var original: original
    enum CodingKeys: String, CodingKey {
        case original = "original"
    }
}

struct original: Decodable {
    var url: String
}


