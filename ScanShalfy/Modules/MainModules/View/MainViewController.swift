//
//  ViewController.swift
//  ScanShalfy
//
//  Created by Drolllted on 04.06.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    weak var mainCoordinator: MainCoordinator?
    private var mainView: MainView!
    
    override func loadView() {
        mainView = MainView()
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("23132")
        setupNavBar()
        delegateTableView()
    }
    
    private func setupNavBar() {
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "ScanShalfy"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusTapped))
    }
    
    //MARK: - Delegate for UITableView
    
    private func delegateTableView() {
        mainView.tableViewSection.delegate = self
        mainView.tableViewSection.dataSource = self
    }
    
    //MARK: - @Objc functions
    
    @objc private func plusTapped() {
        print("123")
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
