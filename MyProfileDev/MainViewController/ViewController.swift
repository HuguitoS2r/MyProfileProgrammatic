import UIKit

class ViewController: UIViewController {
    
    var cards: [(title: String, description: String)] = [
         ("Languages", "Swift, Dart, C#, Visual Basic"),
         ("Frameworks", "UIKit, SwiftUI, Flutter"),
         ("Tools", "Xcode, Git"),
         ("Design Patterns", "MVC, MVVM"),
         ("APIs", "REST, GraphQL"),
         ("UI/UX", "Auto Layout, Storyboards, Programmatic UI")
     ]
    
    var images: [String] = ["appSportFrances", "autotally"]
    
    lazy var collectionProjectsView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 180, height: 170)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.indicatorStyle = .white
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
           collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
           return collectionView
       }()

    lazy var collectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .horizontal
         layout.minimumLineSpacing = 10
         layout.itemSize = CGSize(width: 200, height: 100)
         
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.translatesAutoresizingMaskIntoConstraints = false
         collectionView.indicatorStyle = .white
         collectionView.backgroundColor = .clear
         collectionView.delegate = self
         collectionView.dataSource = self
         collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
         return collectionView
     }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "¡Hola! Soy un desarrollador iOS junior apasionado y dedicado con una sólida base en Swift y UIKit. Tengo un gran interés en crear aplicaciones móviles fluidas y fáciles de usar. Mi viaje hacia el desarrollo de iOS ha sido impulsado por el deseo de combinar tecnología y creatividad para crear experiencias móviles impactantes e innovadoras."
        return label
    }()
    let copyrightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "By HuguitoDev 2024 ✌🏽"
        return label
    }()
    
    let skillsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Skills"
        return label
    }()
    
    let projectsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Projects"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor(rgbValue: 0x102532)
        view.addSubview(descriptionLabel)
        view.addSubview(skillsLabel)
        view.addSubview(copyrightLabel)
        view.addSubview(collectionView)
        view.addSubview(collectionProjectsView)
        view.addSubview(projectsLabel)
        
        let stackInfoPersonal = StackInfoPersonal()
        addChild(stackInfoPersonal)
        stackInfoPersonal.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackInfoPersonal.view)
        stackInfoPersonal.didMove(toParent: self)
        
        let stackButtons = StackButtons()
        addChild(stackButtons)
        stackButtons.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackButtons.view)
        stackButtons.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            stackInfoPersonal.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackInfoPersonal.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackInfoPersonal.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackInfoPersonal.view.heightAnchor.constraint(equalToConstant: 100),
            
            descriptionLabel.topAnchor.constraint(equalTo: stackInfoPersonal.view.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            stackButtons.view.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            stackButtons.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackButtons.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackButtons.view.heightAnchor.constraint(equalToConstant: 40),
            
            skillsLabel.topAnchor.constraint(equalTo: stackButtons.view.bottomAnchor, constant: 20),
            skillsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            skillsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            collectionView.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            
            projectsLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            projectsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            projectsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            collectionProjectsView.topAnchor.constraint(equalTo: projectsLabel.bottomAnchor, constant: 10),
            collectionProjectsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionProjectsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
           


            collectionProjectsView.bottomAnchor.constraint(equalTo: copyrightLabel.topAnchor),
            
            copyrightLabel.topAnchor.constraint(equalTo: collectionProjectsView.bottomAnchor, constant: -10),
           
            copyrightLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            copyrightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}

extension UIColor {
    convenience init(rgbValue: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((rgbValue >> 16) & 0xFF) / 255.0,
            green: CGFloat((rgbValue >> 8) & 0xFF) / 255.0,
            blue: CGFloat(rgbValue & 0xFF) / 255.0,
            alpha: alpha
        )
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return cards.count
        } else {
            return images.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as! CardCell
            let card = cards[indexPath.row]
            cell.configure(with: card.title, description: card.description)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
            let imageName = images[indexPath.row]
            cell.configure(with: UIImage(named: imageName)!)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if collectionView == self.collectionView {
                print("Card \(indexPath.row + 1) clicked")
            } else {
                if indexPath.row == 0 {
                    let appSportController = AppSportController()
                    self.navigationController?.pushViewController(appSportController, animated: true)
                } 
                if indexPath.row == 1 {
                    let autotallyController = AutotallyController()
                    self.navigationController?.pushViewController(autotallyController, animated: true)
                }
                
                else {
                    print("Image \(indexPath.row + 1) clicked")
                }
            }
        }
}


