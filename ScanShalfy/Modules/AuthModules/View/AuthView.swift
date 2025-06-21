//
//  AuthView.swift
//  ScanShalfy
//
//  Created by Drolllted on 20.06.2025.
//

import UIKit

final class AuthView: UIView {
    
    lazy var nameTextField = UITextField()
    private lazy var nameStack = setupTextFiels(textField: nameTextField, placeholderUnderTextField: "Ваше имя")
    
    private lazy var hiLabel: UILabel = {
        let label = UILabel()
        label.text = "Давайте начнем!"
        label.font = .systemFont(ofSize: 38, weight: .bold)
        label.textColor = .white
        label.alpha = 0
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Setup Custom TextFields
    
    private func setupTextFiels(textField: UITextField,
                                placeholderUnderTextField: String,
                                keyboardType: UIKeyboardType = .default) -> UIStackView {
        
        lazy var placeholderUnderTF: UILabel = {
            let label = UILabel()
            label.text = placeholderUnderTextField
            label.textColor = .white
            label.numberOfLines = 1
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 18, weight: .semibold)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        lazy var backView: UIView = {
            let view = UIView()
            view.backgroundColor = .clear
            view.layer.cornerRadius = 15
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.purple.cgColor
            
            view.translatesAutoresizingMaskIntoConstraints = false
            
            return view
        }()
        
        textField.textColor = .white
        textField.borderStyle = .line
        textField.keyboardType = keyboardType
        textField.attributedPlaceholder = NSAttributedString(string: "Напишите \(placeholderUnderTextField)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.label])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.clear.cgColor
        
        lazy var stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 15
            stackView.alignment = .leading
            stackView.distribution = .fillEqually
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(placeholderUnderTF)
            stackView.addArrangedSubview(backView)
            
            return stackView
        }()
        backView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            placeholderUnderTF.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 15),
            
            backView.heightAnchor.constraint(equalToConstant: 40),
            backView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 15),
            backView.leadingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -15),
            
            
            textField.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
            textField.topAnchor.constraint(equalTo: backView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
        ])
        
        
        return stackView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        contraintsUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Animations
    
    func setupAnimationForLabel() {
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.hiLabel.alpha = 1
        } completion: {_ in 
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.upLabelAnimation()
            }
        }
    }
    
    func upLabelAnimation() {
        UIView.animate(withDuration: 1.0, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
            self.hiLabel.transform = CGAffineTransform(translationX: 0, y: -self.frame.height / 3).scaledBy(x: 0.7, y: 0.7)
            self.hiLabel.alpha = 0.5
            
            
        } completion: { _ in
            self.hiLabel.alpha = 1.0
        }

    }
    
}

extension AuthView {
    func setupUI() {
        addSubview(hiLabel)
        addSubview(nameStack)
    }
    
    func contraintsUI() {
        NSLayoutConstraint.activate([
            hiLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            hiLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            nameStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nameStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
        ])
    }
}
