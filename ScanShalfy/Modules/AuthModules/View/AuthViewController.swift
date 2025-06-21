//
//  AuthViewController.swift
//  ScanShalfy
//
//  Created by Drolllted on 20.06.2025.
//

import UIKit

final class AuthViewController: UIViewController{
    
    weak var authCoordinator: AuthCoordinator?
    private var authView: AuthView!
    
    override func loadView() {
        authView = AuthView()
        view = authView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setupNavBar()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        authView.setupAnimationForLabel()
    }
    
    private func setupNavBar() {
        navigationItem.hidesBackButton = true
    }
    
}
