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
        authView.buttonRegistration.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
    }
    
    private func setupNavBar() {
        navigationItem.hidesBackButton = true
    }
    
    //MARK: - Objc func
    
    @objc private func goToMain() {
        guard let name = authView.nameTextField.text,
              let ok = authView.yourOkTextField.text,
              let adress = authView.adressTextField.text,
              !name.isEmpty, !ok.isEmpty, !adress.isEmpty else { return }
        
        let user: [String:String] =
        ["name" : name,
         "ok" : ok,
         "adress" : adress]
        
        UserDefaults.standard.setValue(user, forKey: "User")
        
        authCoordinator?.goToMainVC()
        
    }
    
}
