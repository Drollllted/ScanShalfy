//
//  MainCoordinator.swift
//  ScanShalfy
//
//  Created by Drolllted on 19.06.2025.
//

import UIKit

final class OnBoardingCoordinator: BaseCoordinator{
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let onBoardVC = OnBoardingViewController()
        onBoardVC.onBoardingCoordinator = self
        self.navigationController.pushViewController(onBoardVC, animated: true)
    }
    
}
