//
//  ProfileSubView.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 10.05.2023.
//

import UIKit

protocol ProfileSubViewDelegate {
    func goToProfile()
}

class ProfileSubView: UIView {
    //MARK: - Properties
    
    var delegate: ProfileSubViewDelegate?
    
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
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureAttributedString() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "Hello, ", attributes: [.font: UIFont.boldSystemFont(ofSize: 16), .foregroundColor: UIColor.white])
        attributedText.append(NSAttributedString(string: "Vladimir\n", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.green]))
        attributedText.append(NSAttributedString(string: "30 points", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.white]))
        return attributedText
    }
    
    func configureUI() {
        profileImageView.layer.cornerRadius = 25
        
        backgroundColor = #colorLiteral(red: 0.2235294118, green: 0.2117647059, blue: 0.2745098039, alpha: 1)

        addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            profileImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -6)
        ])
        
        addSubview(greetLabel)
        NSLayoutConstraint.activate([
            greetLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            greetLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
    
    //MARK: - Selectors
    
    @objc func goToProfile() {
        delegate?.goToProfile()
    }
}
