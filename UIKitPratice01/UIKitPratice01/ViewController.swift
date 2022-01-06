//
//  ViewController.swift
//  UIKitPratice（1）
//
//  Created by change on 26/5/2021.
//

import UIKit

class ViewController: UIViewController {
    
    // 取得螢幕的尺寸
    let fullSize = UIScreen.main.bounds.size
    var info = [
        ["訂單記錄", ""],
        ["消費紀錄","我的收藏","商家入駐","評分推薦","填寫問券","領取優惠"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myScrollView()
    }
    
    
    
    lazy var collectView: UICollectionView = {
        
        // 設置底色
        //self.view.backgroundColor = UIColor.white
        
        // 建立 UICollectionViewFlowLayout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        // 設置 section 的間距 四個數值分別代表 上、左、下、右 的間距
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5);
        
        // 設置每一行的間距
        layout.minimumLineSpacing = 5
        
        // 設置每個 cell 的尺寸
        layout.itemSize = CGSize(width: CGFloat(fullSize.width)/4 - 10.0, height: CGFloat(fullSize.width)/4 - 10.0)
        
        // 設置 header 及 footer 的尺寸
        layout.headerReferenceSize = CGSize(width: fullSize.width, height: 30)
        //layout.footerReferenceSize = CGSize(width: fullSize.width, height: 30)
        
        // 建立 UICollectionView
        let myCollectionView = UICollectionView(frame: CGRect(x: 0, y: fullSize.height*1.03, width: fullSize.width, height: 300), collectionViewLayout: layout)
        
        // 註冊 cell 以供後續重複使用
        myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        // 註冊 section 的 header 跟 footer 以供後續重複使用
        myCollectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        
        myCollectionView.backgroundColor = .white
        
        // 設置委任對象
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        return myCollectionView
    }()
    
    lazy var tableView: UITableView = {
        // 建立一個 UILabel
        let myTableView = UITableView(frame: CGRect(x: 0, y: fullSize.height*0.3, width: fullSize.width, height: fullSize.height - 20), style: .grouped)
        
        // 註冊 cell 的樣式及名稱
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // 設置委任對象
        myTableView.delegate = self
        myTableView.dataSource = self
        
        // 分隔線的樣式
        myTableView.separatorStyle = .singleLine
        
        // 分隔線的間距 四個數值分別代表 上、左、下、右 的間距
        myTableView.separatorInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
        
        // 是否可以點選 cell
        myTableView.allowsSelection = true
        
        // 是否可以多選 cell
        myTableView.allowsMultipleSelection = false
        
        return myTableView
    }()
    
    //推薦碼們
    lazy var uiStackView:UIStackView = {
        
        let a = UILabel()
        a.text = "積分"
        a.textAlignment = .center
        a.font = UIFont.systemFont(ofSize: 14)
        let b = UILabel()
        b.text = "券數"
        b.textAlignment = .center
        b.font = UIFont.systemFont(ofSize: 14)
        
        let c = UILabel()
        c.text = "印花"
        c.textAlignment = .center
        c.font = UIFont.systemFont(ofSize: 14)
        let d = UILabel()
        d.text = "推薦碼"
        d.textAlignment = .center
        d.font = UIFont.systemFont(ofSize: 14)
        
        let e = UILabel()
        e.text = "0"
        e.textAlignment = .center
        e.font = UIFont.systemFont(ofSize: 14)
        let f = UILabel()
        f.text = "0"
        f.textAlignment = .center
        f.font = UIFont.systemFont(ofSize: 14)
        let g = UILabel()
        g.text = "100"
        g.textAlignment = .center
        g.font = UIFont.systemFont(ofSize: 14)
        let h = UILabel()
        h.text = "GAAAA"
        h.textAlignment = .center
        h.font = UIFont.systemFont(ofSize: 14)
        
        
        let hStackView = UIStackView(arrangedSubviews: [a, b, c, d])
        hStackView.distribution = .fillEqually
        hStackView.axis = .horizontal
        hStackView.alignment = .center
        hStackView.spacing = 10
        
        
        
        let hStackView2 = UIStackView(arrangedSubviews: [e, f, g, h])
        hStackView2.distribution = .fillEqually
        hStackView2.axis = .horizontal
        hStackView2.alignment = .center
        hStackView2.spacing = 10
        
        
        let uiStackView = UIStackView(arrangedSubviews: [hStackView, hStackView2])
        uiStackView.frame = CGRect(x: 0, y: 120, width: fullSize.width, height: 80)
        uiStackView.axis = .vertical
        uiStackView.distribution = .fillEqually
        
        
        
        
        let button = UIButton()
        button.setTitle("按鈕", for: .normal)
        button.setTitleColor(.red, for: .normal)
        
        return uiStackView
    }()
    
    lazy var uiStackView2:UIStackView = {
        
        let hStackView1 = UIStackView()
        let hStackView2 = UIStackView()
        let hStackView3 = UIStackView()
        
        
        let imageView1 = UIImageView()
        imageView1.image = UIImage(systemName: "person")
        imageView1.frame = CGRect(x: fullSize.width/6-15 , y: 25, width: 30, height: 30)
        imageView1.tintColor = .white
        imageView1.contentMode = .scaleAspectFit
        
        let imageView2 = UIImageView()
        imageView2.image = UIImage(systemName: "wrench")
        imageView2.frame = CGRect(x: fullSize.width/6-15 , y: 25, width: 30, height: 30)
        imageView2.tintColor = .white
        imageView2.contentMode = .scaleAspectFit
        
        
        let userView = UIImageView()
        userView.image = UIImage(named: "1")
        userView.frame = CGRect(x: fullSize.width/6-30 , y: 10, width: 60, height: 60)
        userView.layer.borderWidth = 2
        //hStackView2.layer.masksToBounds = false
        userView.layer.borderColor = UIColor.white.cgColor
        userView.layer.cornerRadius = userView.frame.height/2
        userView.clipsToBounds = true
        
        let uiStackView2 = UIStackView(arrangedSubviews: [hStackView1, hStackView2, hStackView3])
        uiStackView2.frame = CGRect(x: 0, y: 0, width: fullSize.width, height: 100)
        uiStackView2.axis = .horizontal
        uiStackView2.distribution = .fillEqually
        uiStackView2.backgroundColor = #colorLiteral(red: 0.2294699199, green: 0.6793447126, blue: 1, alpha: 1)
        
        
        hStackView1.addSubview(imageView1)
        hStackView2.addSubview(userView)
        hStackView3.addSubview(imageView2)
        
        return uiStackView2
    }()
    
    lazy var uiStackView3:UIStackView = {
        
        var image = UIImageView()
        image.contentMode = .right
        image.image = UIImage(systemName: "creditcard")
        image.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        image.tintColor = .white
        
        let label = UILabel()
        label.textColor = .white
        label.text = "使用者"
        label.textAlignment = .left
        
        let uiStackView3 = UIStackView(arrangedSubviews: [image, label])
        uiStackView3.frame = CGRect(x: 0, y: 80, width: fullSize.width, height: 30)
        uiStackView3.backgroundColor = #colorLiteral(red: 0.2294699199, green: 0.6793447126, blue: 1, alpha: 1)
        uiStackView3.axis = .horizontal
        uiStackView3.distribution = .fillEqually
        
        return uiStackView3
    }()
    
    
    func myScrollView(){
        // 建立 UIScrollView
        let myScrollView = UIScrollView()
        
        // 設置尺寸 也就是可見視圖範圍
        myScrollView.frame = CGRect(x: 0, y: 20, width: fullSize.width, height: fullSize.height - 20)
        
        // 實際視圖範圍 為 3*2 個螢幕大小
        myScrollView.contentSize = CGSize(width: fullSize.width, height: fullSize.height * 1.4)
        
        // 是否顯示水平的滑動條
        myScrollView.showsHorizontalScrollIndicator = true
        
        // 是否顯示垂直的滑動條
        myScrollView.showsVerticalScrollIndicator = false
        
        // 滑動條的樣式
        myScrollView.indicatorStyle = .black
        
        // 是否可以滑動
        myScrollView.isScrollEnabled = true
        
        // 是否可以按狀態列回到最上方
        myScrollView.scrollsToTop = false
        
        // 限制滑動時只能單個方向 垂直或水平滑動
        myScrollView.isDirectionalLockEnabled = false
        
        // 滑動超過範圍時是否使用彈回效果
        myScrollView.bounces = true
        
        // 縮放元件的預設縮放大小
        myScrollView.zoomScale = 1.0
        
        // 縮放元件可縮小到的最小倍數
        myScrollView.minimumZoomScale = 0.5
        
        // 縮放元件可放大到的最大倍數
        myScrollView.maximumZoomScale = 2.0
        
        // 縮放元件縮放時是否在超過縮放倍數後使用彈回效果
        myScrollView.bouncesZoom = true
        
        // 設置委任對象
        myScrollView.delegate = self
        
        // 起始的可見視圖偏移量 預設為 (0, 0)
        // 設定這個值後 就會將原點滑動至這個點起始
        //        myScrollView.contentOffset = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        
        // 以一頁為單位滑動
        myScrollView.isPagingEnabled = false
        
        myScrollView.addSubview(uiStackView)
        myScrollView.addSubview(uiStackView2)
        myScrollView.addSubview(uiStackView3)
        myScrollView.addSubview(tableView)
        myScrollView.addSubview(collectView)
        
        
        self.view.addSubview(myScrollView)
        
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    // 必須實作的方法：每一組有幾個 cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }
    // 必須實作的方法：每個 cell 要顯示的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 取得 tableView 目前使用的 cell
        
        if indexPath.section == 0 && indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
            
            tableView.rowHeight = 120
            
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
            tableView.rowHeight = 50
            //有一行比較高
            //                if indexPath.section == 0 && indexPath.row == 1{
            //                tableView.rowHeight = 120
            //                }else{
            //                    tableView.rowHeight = 50
            //                }
            
            // 設置 Accessory 按鈕樣式
            if indexPath.section == 1 {
                cell.accessoryType = .disclosureIndicator
            }
            // 顯示的內容
            if let myLabel = cell.textLabel {
                myLabel.text = "\(info[indexPath.section][indexPath.row])"
            }
            let image = cell.imageView
            
            if indexPath.section == 0&&indexPath.row == 0{
                image?.image = UIImage(systemName: "text.alignleft")
            }else if indexPath.section == 1&&indexPath.row == 0{
                image?.image = UIImage(systemName: "pencil.and.outline")
            }else if indexPath.section == 1&&indexPath.row == 1{
                image?.image = UIImage(systemName: "heart.circle")
            }else if indexPath.section == 1&&indexPath.row == 2{
                image?.image = UIImage(systemName: "house.fill")
            }else if indexPath.section == 1&&indexPath.row == 3{
                image?.image = UIImage(systemName: "star.circle")
            }else if indexPath.section == 1&&indexPath.row == 4{
                image?.image = UIImage(systemName: "scribble")
            }else if indexPath.section == 1&&indexPath.row == 5{
                image?.image = UIImage(systemName: "dollarsign.circle")
            }
            return cell
        }
        
    }
    
    
    
    //  點選 cell 後執行的動作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 取消 cell 的選取狀態
        tableView.deselectRow(at: indexPath, animated: true)
        
        let name = info[indexPath.section][indexPath.row]
        print("選擇的是 \(name)")
    }
    // 有幾組 section
    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }
    
    
    // 每個 section 的標題
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? " " : " "
        return title
    }
    // 設置 section header 的高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    // 每個 section 的 footer
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return " "
    }
    
    // 設置 section footer 的高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    // 有幾個 section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    // 必須實作的方法：每一組有幾個 cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    // 必須實作的方法：每個 cell 要顯示的內容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 依據前面註冊設置的識別名稱 "Cell" 取得目前使用的 cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
        // 設置 cell 內容 (即自定義元件裡 增加的圖片與文字元件)
        cell.imageView.image = UIImage(named: "0\(indexPath.item + 1).jpg")
        return cell
    }
    
    //  點選 cell 後執行的動作
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("你選擇了第 \(indexPath.section + 1) 組的")
        print("第 \(indexPath.item + 1) 張圖片")
    }
    
    // 設置 reuse 的 section 的 header 或 footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 建立 UICollectionReusableView
        var reusableView = UICollectionReusableView()
        
        // 顯示文字
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: 30))
        label.textAlignment = .center
        
        // header
        if kind == UICollectionView.elementKindSectionHeader {
            // 依據前面註冊設置的識別名稱 "Header" 取得目前使用的 header
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath)
            // 設置 header 的內容
            reusableView.backgroundColor = UIColor.white
            label.text = "熱門兌換"
            label.textAlignment = .left
            label.textColor = UIColor.black
        }
        reusableView.addSubview(label)
        return reusableView
    }
    
}
