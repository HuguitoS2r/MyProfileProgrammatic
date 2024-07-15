//
//  AutotallyController.swift
//  MyProfileDev
//
//  Created by Hugo Huichalao on 14-07-24.
//

import Foundation
import UIKit

class AutotallyController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Autotally"
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
           Aplicación móvil desarrollada con .NET (Xamarin y C#), diseñada específicamente para registrar y gestionar los tiempos de atención en los peajes. Desarrollada completamente por mí, en base a conversaciones y requisitos establecidos con el cliente, asegurando que la app cumple con todas las especificaciones solicitadas.
           
           🔹Informes Detallados: Genera informes completos sobre los tiempos de atención y otros datos relevantes, facilitando la toma de decisiones informadas.
           🔹Gestión de Usuarios: Incluye funcionalidades de gestión de usuarios con distintos roles y permisos, asegurando que solo el personal autorizado tenga acceso a ciertas funcionalidades.
           🔹Seguridad de Datos: La información registrada es resguardada de manera segura en una base de datos SQL, cumpliendo con los estándares de seguridad y privacidad.

           Uso en la Industria:
           AutoTally está siendo utilizada en las principales autopistas de Perú, mejorando la eficiencia y la gestión en los peajes.
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
    
    var images: [String] = ["autotallyLogin", "autotallyMenu"]
    
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

extension AutotallyController: UICollectionViewDelegate, UICollectionViewDataSource {
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


