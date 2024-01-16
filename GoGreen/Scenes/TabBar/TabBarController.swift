//
//  TabBarController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import UIKit
import SwiftUI

final class TabBarController: UITabBarController {
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupUI()
    }
    
    // MARK: - Tab Setup
    private func setupTabs() {
        let contentViewHostingController = createHostingController(title: "Home", image: UIImage(systemName: "house"), rootView: ContentView())
        let flowerRecognitionViewController = createNavigationController(title: "Flower Recognition", image: UIImage(systemName: "camera"), viewController: FlowerRecognitionViewController())
        let myGardenViewController = createNavigationController(title: "My Garden", image: UIImage(systemName: "leaf"), viewController: MyGardenViewController())
        
        setViewControllers([contentViewHostingController, flowerRecognitionViewController, myGardenViewController],
                           animated: true)
    }
    
    // MARK: - NavigationController Setup
    private func createNavigationController(title: String, image: UIImage?, viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.viewControllers.first?.navigationItem.title = title
        return navigationController
    }
    
    // MARK: - HostingController Setup
    private func createHostingController<Content: View>(title: String, image: UIImage?, rootView: Content) -> UIHostingController<Content> {
        let hostingController = UIHostingController(rootView: rootView)
        hostingController.tabBarItem.title = title
        hostingController.tabBarItem.image = image
        return hostingController
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        tabBar.unselectedItemTintColor = .white.withAlphaComponent(0.5)
        tabBar.standardAppearance = createTabBarAppearance()
        tabBar.scrollEdgeAppearance = createTabBarScrollEdgeAppearance()
    }
    
    private func createTabBarAppearance() -> UITabBarAppearance {
        let tabBarAppearance = UITabBarAppearance()
        return tabBarAppearance
    }

    private func createTabBarScrollEdgeAppearance() -> UITabBarAppearance {
        let tabBarScrollEdgeAppearance = UITabBarAppearance()
        return tabBarScrollEdgeAppearance
    }
}
