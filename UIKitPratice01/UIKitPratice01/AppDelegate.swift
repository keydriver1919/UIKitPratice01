//
//  AppDelegate.swift
//  UIKitPratice（1）
//
//  Created by change on 26/5/2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ToolBar()
        
        return true
    }
    
    
    func ToolBar(){
    // 建立一個 UIWindow
    self.window = UIWindow(frame: UIScreen.main.bounds)

    // 設置底色
    self.window!.backgroundColor = UIColor.white

    // 建立 UITabBarController
    let myTabBar = UITabBarController()

    // 設置標籤列
    // 使用 UITabBarController 的屬性 tabBar 的各個屬性設置
    myTabBar.tabBar.backgroundColor = UIColor.clear

    // 建立頁面 使用系統圖示
    let mainViewController = ArticleViewController()
        mainViewController.tabBarItem = UITabBarItem(title: "券庫", image: UIImage(systemName: "gift"), selectedImage: UIImage(systemName: "gift.fill"))
        
    // 建立頁面 使用自定義圖示 有預設圖片及按下時圖片
        let coolViewController = CoolViewController()
        coolViewController.tabBarItem = UITabBarItem(title: "首頁", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
    let articleViewController = ViewController()
    articleViewController.tabBarItem = UITabBarItem(title: "商城", image: UIImage(systemName: "gamecontroller"), selectedImage: UIImage(systemName: "gamecontroller.fill"))

    // 建立頁面 使用自定義圖示 只有預設圖片
    let introViewController = IntroViewController()
        introViewController.tabBarItem = UITabBarItem(title: "點數兌換", image: UIImage(systemName: "cube.box"), selectedImage: UIImage(systemName: "cube.box.fill"))
        

    // 建立頁面 使用自定義圖示 可使用 tabBarItem 的屬性各自設定
    let settingViewController = SettingViewController()
        settingViewController.tabBarItem = UITabBarItem(title: "我的", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))

    // 加入到 UITabBarController
    myTabBar.viewControllers = [coolViewController, mainViewController, articleViewController, introViewController, settingViewController]

    // 預設開啟的頁面 (從 0 開始算起)
    myTabBar.selectedIndex = 2

    // 設置根視圖控制器
    self.window!.rootViewController = myTabBar

    // 將 UIWindow 設置為可見的
    self.window!.makeKeyAndVisible()
    }

}


