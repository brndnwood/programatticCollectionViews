//
//  PosterDataCell.swift
//  CollectionViewLayout
//
//  Created by Brandon Wood on 9/4/19.
//  Copyright © 2019 Brandon Wood. All rights reserved.
//

import UIKit

class PosterDataCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 20))
        label.text = "hello"
        self.layer.cornerRadius = 5
        self.contentView.addSubview(label)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
