//
//  MainTabController.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 09.05.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    //MARK: - Properties
    
    
    
    private let qrCodeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.2235294118, green: 0.2117647059, blue: 0.2745098039, alpha: 1)
        button.setImage(UIImage(named: "qr"), for: .normal)
        button.addTarget(self, action: #selector(qrCodeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectedIndex = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        selectedIndex = 0
        configureUI()
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.addSubview(qrCodeButton)
        
        NSLayoutConstraint.activate([
            qrCodeButton.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 40),
            qrCodeButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor, constant: 0),
            
            qrCodeButton.heightAnchor.constraint(equalToConstant: 60),
            qrCodeButton.widthAnchor.constraint(equalToConstant: 60),
        ])
        
        qrCodeButton.layer.cornerRadius = 30
        
    }
    
    func configureVC() {
        
        let mainVC = MainViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let main = templateNavController(image: UIImage(named: "house")!, rootVC: mainVC)
        
        let coffeeVC = CoffeeShopsViewController()
        let coffee = templateNavController(image: UIImage(named: "coffee")!, rootVC: coffeeVC)
        
        let qrCodeVC = CoffeeShopsViewController()
        let qrCode = templateNavController(image: UIImage(named: "Empty")!, rootVC: qrCodeVC)
        
        let historyVC = HistoryViewController()
        let history = templateNavController(image: UIImage(named: "history")!, rootVC: historyVC)
        
        let menuVC = MenuViewController()
        let menu = templateNavController(image: UIImage(named: "menu")!, rootVC: menuVC)
        
        
        
        viewControllers = [main, coffee, qrCode, history, menu]
        
        tabBar.items?[0].title = "Home"
        tabBar.items?[1].title = "Сoffee shops"
        tabBar.items?[3].title = "History"
        tabBar.items?[4].title = "Menu"
        
        tabBar.backgroundColor = UIColor(white: -5, alpha: 1)
        tabBar.tintColor = .black
        
        tabBar.barStyle = .default
        tabBar.inputViewController?.hidesBottomBarWhenPushed = false
        
        tabBar.backgroundColor = .white
        
    }
    
    func templateNavController(image: UIImage, rootVC: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootVC)
        
        let selectedImage = UIImageView(image: image)
        selectedImage.tintColor = .white
        
        nav.tabBarItem.image = image
        nav.tabBarItem.selectedImage = image.withTintColor(UIColor.systemRed)
        nav.tabBarController?.tabBar.backgroundColor = .black
        nav.navigationController?.isNavigationBarHidden = true
        
        return nav
    }
    
    //MARK: - Selectors
    
    @objc func qrCodeButtonPressed() {
        
        let vc = UINavigationController(rootViewController: QRCodeViewController())
        vc.modalPresentationStyle = .formSheet
        
        
        present(vc, animated: true)
    }
    
}


