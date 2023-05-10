//
//  CoffeeShopsViewController.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 09.05.2023.
//

import UIKit

private let reuseIdentifier = "CoffeeShopCell"

class CoffeeShopsViewController: UICollectionViewController {
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9333333333, blue: 0.8784313725, alpha: 1)
        configureNavBar()
        configureCollectionView()
    }
    
    //MARK: - UICollectionViewDelegate & UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CoffeeShopCell
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    //MARK: - Helpers
    

    
    func configureNavBar() {
        navigationItem.title = "Coffee shops"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "location"), style: .plain, target: self, action: #selector(coffeeShopsButtonPressed))
        
        navigationController?.navigationBar.tintColor = .black
        
    }
    
    func configureCollectionView() {
        collectionView.register(CoffeeShopCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9333333333, blue: 0.8784313725, alpha: 1)
    }
    
    //MARK: - Selectors
    
    @objc func coffeeShopsButtonPressed() {
        print("Coffee shops")
    }
}

extension CoffeeShopsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: view.frame.width - 20, height: view.frame.height / 3 + 30)
        return size
    }
}
