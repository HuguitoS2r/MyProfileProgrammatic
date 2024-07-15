//
//  StackButtons.swift
//  MyProfileDev
//
//  Created by Hugo Huichalao on 14-07-24.
//

import Foundation
import UIKit

class StackButtons: UIViewController {
    
    private let buttonStackView: UIStackView = {
                let stackView = UIStackView()
                stackView.axis = .horizontal
                stackView.spacing = 10
                stackView.distribution = .fillEqually
                stackView.translatesAutoresizingMaskIntoConstraints = false
                return stackView
            }()
    
    let followMeButton: UIButton = {
        let button = UIButton()
        button.setTitle("👍🏽 Follow Me", for: .normal)
        button.backgroundColor = UIColor(rgbValue: 0x1a2c45)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(rgbValue: 0xf9f972), for: .normal)
        return button
    }()
    
    let hireMeButton: UIButton = {
        let button = UIButton()
        button.setTitle("🤓 Hire Me", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
   
    
    private func setupViews() {
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(followMeButton)
                  buttonStackView.addArrangedSubview(hireMeButton)
        NSLayoutConstraint.activate([
            followMeButton.heightAnchor.constraint(equalToConstant: 40),
            followMeButton.widthAnchor.constraint(equalToConstant: 150),
            followMeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hireMeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
}
