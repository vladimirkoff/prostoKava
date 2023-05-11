//
//  ProfileHeader.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 11.05.2023.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    //MARK: - Properties
    
    lazy private var changeProfilePhotoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 140).isActive = true
        button.widthAnchor.constraint(equalToConstant: 140).isActive = true
        return button
    }()
    

    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.text = "+380 99 555 6338"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        addSubview(changeProfilePhotoButton)
        NSLayoutConstraint.activate([
            changeProfilePhotoButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            changeProfilePhotoButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            changeProfilePhotoButton.widthAnchor.constraint(equalToConstant: 100),
            changeProfilePhotoButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        changeProfilePhotoButton.layer.cornerRadius = 50
        
        addSubview(phoneNumberLabel)
        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: changeProfilePhotoButton.bottomAnchor, constant: 12),
            phoneNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

    }
    
    //MARK: - Selectors
    
    @objc func chooseImage() {
        print("Change image")
    }
}
