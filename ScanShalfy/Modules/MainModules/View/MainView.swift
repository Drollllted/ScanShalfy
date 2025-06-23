//
//  MainView.swift
//  ScanShalfy
//
//  Created by Drolllted on 23.06.2025.
//

import UIKit

final class MainView: UIView {
    
    var tableViewSection: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        constraintsUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension MainView {
    
    func setupUI(){
        addSubview(tableViewSection)
    }
    
    func constraintsUI() {
        NSLayoutConstraint.activate([
            tableViewSection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableViewSection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableViewSection.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            tableViewSection.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
