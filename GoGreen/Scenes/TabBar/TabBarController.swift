//
//  TabBarController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import UIKit
import SwiftUI
import NetworkManager

final class TabBarController: UITabBarController {
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupOnboarding()
    }
    
    
    // MARK: - Setup Onboarding
    private func setupOnboarding() {
        let hasShownOnboarding = UserDefaults.standard.bool(forKey: UserDefaultsKeys.hasShownOnboarding)
        if !hasShownOnboarding {
            presentOnboardingView()
        }
    }
    
    private func presentOnboardingView() {
        let onboardingView = OnboardingView(dismissTabView: { [weak self] in
            self?.dismiss(animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: UserDefaultsKeys.hasShownOnboarding)
        })
        
        let hostingController = UIHostingController(rootView: onboardingView)
        hostingController.modalPresentationStyle = .fullScreen
        
        present(hostingController, animated: true, completion: nil)
    }
    
    // MARK: - Tab Setup
    private func setupTabs() {
        let contentViewHostingController = createHostingController(title: "Home", image: UIImage(systemName: "house"), rootView: ContentView())
        let flowerRecognitionViewController = createNavigationController(title: "Flower Recognition", image: UIImage(systemName: "camera"), viewController: FlowerRecognitionViewController(viewModel: FlowerRecognitionViewModel(networkManager: NetworkManager()), alertManager: AlertManager(), imagePickerManager: ImagePickerManager()))
        let myGardenViewController = createNavigationController(title: "My Garden", image: UIImage(systemName: "leaf"), viewController: MyGardenViewController(viewModel: MyGardenViewModel(localFileManager: LocalFileManager())))
        
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
