//
//  AppSportController.swift
//  MyProfileDev
//
//  Created by Hugo Huichalao on 14-07-24.
//

import Foundation
import UIKit

class AppSportController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "App Sport Francés"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 0
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = """
           Su objetivo es mostrar la información más importante y relevante del Club de Golf de manera fácil y rápida. Esta app está diseñada específicamente para los socios, proporcionando una experiencia fluida para mantenerse al día con las actividades, eventos y anuncios del club.
           
           Características:
           
           🔹 Información Integral: Obtén acceso instantáneo a toda la información clave sobre el club.
           🔹 Diseño Orientado a Socios: Adaptada para satisfacer las necesidades y preferencias de los socios del club.
           🔹 APIs Integradas: Desarrollada utilizando C# y Visual Basic, la app se conecta sin problemas con la base de datos del club para proporcionar actualizaciones e información en tiempo real.
           🔹 Desarrollo sin Código: Creada con Adalo, asegurando una interfaz amigable y eficiente.
           
           La app se encuentra disponible en ambas Stores, es compatible con iOS y Android.
           """
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 170, height: 170)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.indicatorStyle = .white
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        return collectionView
    }()
    
    var images: [String] = ["sfLogin", "sfMain"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(rgbValue: 0x102532)
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 170),
            
           
        ])
    }
}

extension AppSportController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        let imageName = images[indexPath.row]
        cell.configure(with: UIImage(named: imageName)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let selectedImage = UIImage(named: images[indexPath.row])
            let detailViewController = ImageDetailViewController()
            detailViewController.image = selectedImage
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
}


