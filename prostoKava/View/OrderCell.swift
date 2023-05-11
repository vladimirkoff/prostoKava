//
//  OrderCell.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 10.05.2023.
//

import UIKit

class OrderCell: UICollectionViewCell {
    //MARK: - Proeprties
    
    lazy private var coffeeShopName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.attributedText = configureAttributedString(first: "Marry Berry", second: "Bunin 35 street", color: .lightGray)
        return label
    }()
    
    lazy private var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.attributedText = configureAttributedString(first: "433$", second: "Recieved", color: .green)
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "01.08.2022 18:30"
        return label
    }()
    
    private let detailsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Details", for: .normal)
        return button
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
        addSubview(coffeeShopName)
        NSLayoutConstraint.activate([
            coffeeShopName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            coffeeShopName.topAnchor.constraint(equalTo: self.topAnchor, constant: 12)
        ])
        
        addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
        
        addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            timeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
        ])
    }
    
    func configureAttributedString(first: String, second: String, color: UIColor) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "\(first)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 18), .foregroundColor: UIColor.black])
        attributedText.append(NSAttributedString(string: "\n", attributes: [.font: UIFont.systemFont(ofSize: 14)]))
        attributedText.append(NSAttributedString(string: "\(second)", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: color]))
        return attributedText
    }
    
    
}
