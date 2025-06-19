//
//  OnBoardingView.swift
//  ScanShalfy
//
//  Created by Drolllted on 19.06.2025.
//

import UIKit
import Lottie

final class OnBoardingView: UIView {
    
    private lazy var lottieAnimation: UIView = {
        let lottie = LottieAnimationView(name: "scan")
        lottie.loopMode = .loop
        lottie.contentMode = .scaleAspectFit
        lottie.animationSpeed = 1
        
        lottie.translatesAutoresizingMaskIntoConstraints = false
        lottie.heightAnchor.constraint(equalToConstant: 300).isActive = true
        lottie.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        let view = UIView()
        view.addSubview(lottie)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        lottie.play()
        
        return view
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 15
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var onBoardingText: UILabel = {
        let label = UILabel()
        label.text = "Данное приложение поможет отслеживать реализацию и перечень привезенных продуктов из складов в магазины"
        label.numberOfLines = 4
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var goButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.titleLabel?.textColor = .white
        
        button.layer.cornerRadius = 15
        button.backgroundColor = .blue
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        constraintUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func changeText(string: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.darkGray, range: NSRange())
        return attributedString
    }
    
}
extension OnBoardingView {
    func setupUI(){
        addSubview(lottieAnimation)
        addSubview(bottomView)
        bottomView.addSubview(onBoardingText)
        bottomView.addSubview(goButton)
    }

    func constraintUI() {
        NSLayoutConstraint.activate([
            lottieAnimation.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lottieAnimation.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            lottieAnimation.heightAnchor.constraint(equalToConstant: 300),
            lottieAnimation.widthAnchor.constraint(equalToConstant: 300),
            
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 320),
            
            onBoardingText.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15),
            onBoardingText.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15),
            onBoardingText.topAnchor.constraint(equalTo: bottomView.topAnchor , constant: 30),
            onBoardingText.heightAnchor.constraint(equalToConstant: 100),
            
            goButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15),
            goButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15),
            goButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -80),
            goButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
