//
//  SceneDelegate.swift
//  RSSchool_T9
//
//  Created by Mikita Shalima on 28.07.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    let squareGridImage = UIImage(systemName: "square.grid.2x2")
    let gearImage = UIImage(systemName: "gear")

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let tabBarContoller = TabBarController()
        let mainView = MainViewController()
        let settingView = SettingsViewController()
        
        mainView.tabBarItem = UITabBarItem(title: "Items", image: squareGridImage, tag: 0)
        settingView.tabBarItem = UITabBarItem(title: "Settings", image: gearImage, tag: 0)
        
        tabBarContoller.viewControllers = [mainView, settingView]
        
        settingView.delegateM = mainView
        
        window?.rootViewController = tabBarContoller
        window?.makeKeyAndVisible()
    }

}

