//
//  AuthCoordinator.swift
//  ScanShalfy
//
//  Created by Drolllted on 20.06.2025.
//

import UIKit

final class AuthCoordinator: BaseCoordinator{
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let authVC = AuthViewController()
        authVC.authCoordinator = self
        self.navigationController.pushViewController(authVC, animated: true)
    }
    
    func goToMainVC() {
        let main = MainCoordinator(navigationController: navigationController)
        add(coordinator: main)
        main.start()
    }
    
}
