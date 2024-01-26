//
//  SceneDelegate.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 16.01.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = TabBarController()
        self.window = window
        self.window?.makeKeyAndVisible()

    }
    
    // Reset the notification Badge Count
    func sceneDidBecomeActive(_ scene: UIScene) {
        UNUserNotificationCenter.current().setBadgeCount(0, withCompletionHandler: nil)
    }
    
}

