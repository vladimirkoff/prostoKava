//
//  CoffeeShopsViewController.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 09.05.2023.
//

import UIKit

class CoffeeShopsViewController: UIViewController {
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9333333333, blue: 0.8784313725, alpha: 1)
        configureNavBar()
    }
    
    //MARK: - Helpers
    
    func configureNavBar() {
        navigationItem.title = "Coffee shops"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "location"), style: .plain, target: self, action: #selector(coffeeShopsButtonPressed))
        
        navigationController?.navigationBar.tintColor = .black
        
    }
    
    //MARK: - Selectors
    
    @objc func coffeeShopsButtonPressed() {
        print("Coffee shops")
    }
}
