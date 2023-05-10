//
//  MainViewController.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 09.05.2023.
//

import UIKit

private let reuseIdentifier = "FoodCell"
private let headerReuseIdentifier = "MainHeader"

class MainViewController: UICollectionViewController {
    //MARK: - Properties
    
    private let profileSubview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy private var greetLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.numberOfLines = 0
         let string = configureAttributedString()
         label.attributedText = string
         label.textAlignment = .left
         return label
     }()
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.backgroundColor = .black
        iv.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToProfile))
        iv.addGestureRecognizer(gestureRecognizer)
        
        return iv
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCollectionView()
    }
    
    //MARK: - Helpers
    
    func configureCollectionView() {
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(MainHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        
        collectionView.backgroundColor = .red
    }

    func configureAttributedString() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "Hello, Vladimir!\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 16)])
        attributedText.append(NSAttributedString(string: "30 points", attributes: [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.red]))
        return attributedText
    }
    
    func configureUI() {
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9333333333, blue: 0.8784313725, alpha: 1)
        
        view.addSubview(profileSubview)
        NSLayoutConstraint.activate([
            profileSubview.topAnchor.constraint(equalTo: view.topAnchor),
            profileSubview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileSubview.widthAnchor.constraint(equalToConstant: view.frame.width),
            profileSubview.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        view.addSubview(greetLabel)
        NSLayoutConstraint.activate([
            greetLabel.bottomAnchor.constraint(equalTo: profileSubview.bottomAnchor, constant: -8),
            greetLabel.leftAnchor.constraint(equalTo: profileSubview.leftAnchor, constant: 8)
        ])
        
        view.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            profileImageView.bottomAnchor.constraint(equalTo: profileSubview.bottomAnchor, constant: -6),
            profileImageView.rightAnchor.constraint(equalTo: profileSubview.rightAnchor, constant: -4)
        ])
        profileImageView.layer.cornerRadius = 25
        
    }
    
    //MARK: - Selectors
    
   @objc func goToProfile() {
       let vc = ProfileViewController(nibName: nil, bundle: nil)
       navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UICollectionViewDelegate & UICollectionViewDataSource

extension MainViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCell
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 180, height: 100)
        return size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! MainHeader
        header.backgroundColor = .black
        return header
    }
}



