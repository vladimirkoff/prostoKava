//
//  CoffeeShopCell.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 10.05.2023.
//

import UIKit

class CoffeeShopCell: UICollectionViewCell {
    //MARK: - Properties
    
    private let coffeeShopImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    
   lazy private var coffeeShopName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.attributedText = configureAttributedString(name: "Gorky Espresso & Wine Bar", location: "Oleksandr Oles 4b street")
        return label
    }()
    
    private let workingScheduleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Open 7:30 - 21:00"
        return label
    }()
    
    private let greenCircleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        view.layer.cornerRadius = 5
        return view
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
    
    func configureAttributedString(name: String, location: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "\(name)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 18), .foregroundColor: UIColor.black])
        attributedText.append(NSAttributedString(string: "\n", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        attributedText.append(NSAttributedString(string: "\(location)", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.black]))
        return attributedText
    }
    
    func configureCell() {
        self.clipsToBounds = true
        
        self.addSubview(coffeeShopImageView)
        NSLayoutConstraint.activate([
            coffeeShopImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            coffeeShopImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            coffeeShopImageView.topAnchor.constraint(equalTo: self.topAnchor),
            coffeeShopImageView.heightAnchor.constraint(equalToConstant: self.frame.height * 3/4 - 15)
        ])
        
        addSubview(coffeeShopName)
        NSLayoutConstraint.activate([
            coffeeShopName.topAnchor.constraint(equalTo: coffeeShopImageView.bottomAnchor, constant: 4),
            coffeeShopName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12)
        ])
        
        addSubview(greenCircleView)
        NSLayoutConstraint.activate([
            greenCircleView.heightAnchor.constraint(equalToConstant: 10),
            greenCircleView.widthAnchor.constraint(equalToConstant: 10),
            greenCircleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            greenCircleView.topAnchor.constraint(equalTo: coffeeShopName.bottomAnchor, constant: 12)
        ])
        
        addSubview(workingScheduleLabel)
        NSLayoutConstraint.activate([
            workingScheduleLabel.leftAnchor.constraint(equalTo: greenCircleView.rightAnchor, constant: 4),
            workingScheduleLabel.centerYAnchor.constraint(equalTo: greenCircleView.centerYAnchor)
        ])
    }
}
