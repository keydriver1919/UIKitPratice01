//
//  CollectionViewCell.swift
//  UIKitPratice（1）
//
//  Created by change on 26/5/2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    var titleLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        // 取得螢幕寬度
        let fullSize = Double(UIScreen.main.bounds.size.width)
        
        // 建立一個 UIImageView
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: fullSize/4 - 10.0, height: fullSize/4 - 10.0))
        self.addSubview(imageView)
        
        // 建立一個 UILabel
         titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: fullSize/4 - 10.0, height: 40))
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.orange
        self.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
