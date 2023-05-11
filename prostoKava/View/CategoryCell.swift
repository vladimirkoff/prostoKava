//
//  CategoryCell.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 09.05.2023.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    //MARK: - Properties
    
    private let categoryImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        iv.backgroundColor = .gray
        iv.image = UIImage(named: "coffee2")
        return iv
    }()
    
    private let nameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.2235294118, green: 0.2117647059, blue: 0.2745098039, alpha: 1)
        view.clipsToBounds = true
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Coffee"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureCell() {
        
        clipsToBounds = true
        
        addSubview(categoryImageView)
        NSLayoutConstraint.activate([
            categoryImageView.leftAnchor.constraint(equalTo: leftAnchor),
            categoryImageView.rightAnchor.constraint(equalTo: rightAnchor),
            categoryImageView.topAnchor.constraint(equalTo: topAnchor),
            categoryImageView.heightAnchor.constraint(equalToConstant: frame.height)
        ])
        
        addSubview(nameView)
        NSLayoutConstraint.activate([
            nameView.leftAnchor.constraint(equalTo: leftAnchor),
            nameView.topAnchor.constraint(equalTo: topAnchor),
            nameView.widthAnchor.constraint(equalToConstant: 100),
            nameView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: nameView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: nameView.centerYAnchor)
        ])
    }
}
