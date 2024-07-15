//
//  StackInfoPersonal.swift
//  MyProfileDev
//
//  Created by Hugo Huichalao on 14-07-24.
//

import Foundation
import UIKit

class StackInfoPersonal: UIViewController {
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let circleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue // Color de fondo del contenedor
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "profile1")
        return imageView
    }()
    
    private let nameLabel: UILabel = {
             let label = UILabel()
             label.font = UIFont.boldSystemFont(ofSize: 19)
          label.textColor = .white
             label.translatesAutoresizingMaskIntoConstraints = false
          label.text = "Hugo Huichalao"
             return label
         }()
    
    private let devMobileLabel: UILabel = {
             let label = UILabel()
             label.font = UIFont.boldSystemFont(ofSize: 16)
          label.textColor = .lightGray
             label.translatesAutoresizingMaskIntoConstraints = false
          label.text = "iOS Mobile Developer"
             return label
         }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Asegurarse de que el contenedor sea un círculo
        circleContainerView.layer.cornerRadius = 50
        circleContainerView.layer.masksToBounds = true
        
       
    }
    
    private func setupViews() {
        view.addSubview(containerView)
        containerView.addSubview(circleContainerView)
        circleContainerView.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(devMobileLabel)
        
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 100),
            
            circleContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            circleContainerView.heightAnchor.constraint(equalToConstant: 100),
            circleContainerView.widthAnchor.constraint(equalToConstant: 100),
            
            imageView.centerXAnchor.constraint(equalTo: circleContainerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: circleContainerView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.leadingAnchor.constraint(equalTo: circleContainerView.trailingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            
            devMobileLabel.leadingAnchor.constraint(equalTo: circleContainerView.trailingAnchor, constant: 10),
            devMobileLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
           
            
        ])
    }
}
