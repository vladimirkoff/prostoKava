//
//  ItemCell.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 10.05.2023.
//

import UIKit

class ItemCell: UICollectionViewCell {
    //MARK: - Properties
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Espresso"
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "1.50$"
        return label
    }()
    
    private let itemImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
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
        addSubview(itemImageView)
        NSLayoutConstraint.activate([
            itemImageView.leftAnchor.constraint(equalTo: leftAnchor),
            itemImageView.rightAnchor.constraint(equalTo: rightAnchor),
            itemImageView.heightAnchor.constraint(equalToConstant: frame.height * 3/4),
            itemImageView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 6),
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 4)
        ])
        
        addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6)
        ])
    }
    
}
