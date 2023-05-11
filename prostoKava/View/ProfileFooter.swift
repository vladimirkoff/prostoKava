//
//  ProfileFooter.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 11.05.2023.
//

import UIKit

class ProfileFooter: UICollectionReusableView {
    //MARK: - Properties
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.2235294118, green: 0.2117647059, blue: 0.2745098039, alpha: 1)
        button.setTitle("Save changes", for: .normal)
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureFooter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureFooter() {
        addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: frame.width / 1.5),
            saveButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    //MARK: - Selectors
    
    @objc func saveButtonPressed() {
        
    }
}
