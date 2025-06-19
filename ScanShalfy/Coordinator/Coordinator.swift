//
//  Coordinator.swift
//  ScanShalfy
//
//  Created by Drolllted on 19.06.2025.
//

import UIKit

protocol Coordinator: AnyObject {
    var childrenCoordinator: [Coordinator] {get set}
    func start()
}


extension Coordinator{
    func add(coordinator: Coordinator) {
        childrenCoordinator.append(coordinator)
    }
    
    func remote(coordinator: Coordinator) {
        childrenCoordinator = childrenCoordinator.filter({$0 !== coordinator})
    }
}
