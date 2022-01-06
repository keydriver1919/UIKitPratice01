//
//  SettingViewController.swift
//  UIKitPratice（1）
//
//  Created by change on 26/5/2021.
//

import UIKit

class SettingViewController: UIViewController {
    // 取得螢幕的尺寸
    let fullSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 建立一個 UILabel
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        myLabel.backgroundColor = #colorLiteral(red: 0.2294699199, green: 0.6793447126, blue: 1, alpha: 1)
        myLabel.text = "我的"
        myLabel.textAlignment = .center
        myLabel.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.2)
        myLabel.textColor = .white

        self.view.addSubview(myLabel)
        
        
        
    }
    
    
    
    

}
