//
//  GifCell.swift
//  GiphySearch_iOS
//
//  Created by junhyuk on 2020/08/19.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit



class GifCell: UITableViewCell {
    
    var gif: Gif?
    var gifView: UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleAspectFit
        return v
        
    }()
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        if gif != nil {
            
            let gifURL = gif!.getGifURL()
            gifView.image = UIImage.gif(url: gifURL)
            gifView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
            addSubview(gifView)
        }
        
        //Add Views.
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
