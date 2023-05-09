//
//  HistoryViewController.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 09.05.2023.
//

import UIKit

class HistoryViewController: UIViewController {
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavBar()
    }
    
    //MARK: - Helpers
    
    func configureNavBar() {
        navigationItem.title = "History"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
                
    }
}
