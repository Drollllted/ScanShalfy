//
//  AppCoordinator.swift
//  ScanShalfy
//
//  Created by Drolllted on 19.06.2025.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    private var window: UIWindow
    
    private let navigationController: UINavigationController = {
        let nav = UINavigationController()
        nav.navigationBar.prefersLargeTitles = true
        
        return nav
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        
        if UserDefaults.standard.dictionary(forKey: "User") != nil {
            let main = MainCoordinator(navigationController: navigationController)
            add(coordinator: main)
            main.start()
        } else {
            let onBoarding = OnBoardingCoordinator(navigationController: navigationController)
            add(coordinator: onBoarding)
            onBoarding.start()
        }
    }
    
}
