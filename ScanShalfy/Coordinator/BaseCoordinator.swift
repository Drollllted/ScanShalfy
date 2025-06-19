//
//  BaseCoordinator.swift
//  ScanShalfy
//
//  Created by Drolllted on 19.06.2025.
//

import UIKit

class BaseCoordinator: Coordinator{
    var childrenCoordinator: [any Coordinator] = []
    
    func start() {
        fatalError("Child")
    }
    
    
}
