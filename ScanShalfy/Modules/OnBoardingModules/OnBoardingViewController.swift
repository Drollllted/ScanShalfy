//
//  OnBoardingViewController.swift
//  ScanShalfy
//
//  Created by Drolllted on 19.06.2025.
//

import UIKit

final class OnBoardingViewController: UIViewController{
    
    weak var onBoardingCoordinator: OnBoardingCoordinator?
    private var onBoardingView: OnBoardingView!
    
    override func loadView() {
        onBoardingView = OnBoardingView()
        view = onBoardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
    
}
