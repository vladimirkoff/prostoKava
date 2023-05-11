//
//  AuthView.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 09.05.2023.
//

import UIKit

protocol CustomAuthViewDelegate {
    func continueButtonPressed()
}

class CustomAuthView: UIView {
    //MARK: - Properties
    
    var delegate: CustomAuthViewDelegate?
    
    private let acceptPrivacyPolicy: UILabel = {
        let label = UILabel()
        label.textColor = .systemGroupedBackground
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "By clicking “Continue”, you agree to our terms of service, privacy policy and cookie policy"
        return label
    }()
    
    private let phoneTextView: UITextView = {
        let tv = UITextView()
        tv.text = " +380 99 555 6338"
        tv.font = UIFont.boldSystemFont(ofSize: 40)
        tv.textColor = .black
        tv.layer.cornerRadius = 50
        tv.backgroundColor = .white
        tv.textAlignment = .left
        tv.keyboardType = .numberPad
        return tv
    }()
    
   lazy var continureButton: UIButton = {
        let button = UIButton()
       button.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.2235294118, green: 0.2117647059, blue: 0.2745098039, alpha: 1)
        button.setTitle("Continue", for: .normal)
        button.layer.cornerRadius = 40
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 50
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureView()
    }
    
    
    //MARK: - Helpers
    
    func configureView() {
        
        let textViewFrame = CGRect(x: 0, y: 5, width: frame.width, height: frame.height / 5)
        addSubview(phoneTextView)
        
        phoneTextView.frame = textViewFrame

        
        let buttonFrame = CGRect(x: 30, y: phoneTextView.frame.midY + 20, width: frame.width - 50, height:frame.height / 6 )

        addSubview(continureButton)
        continureButton.frame = buttonFrame
        
        
        let labelFrame = CGRect(x: 10, y: continureButton.frame.maxY + 20, width: frame.width - 20, height: 50)
        addSubview(acceptPrivacyPolicy)
        acceptPrivacyPolicy.frame = labelFrame
        
    }
    
    //MARK: - Selectors
    
    @objc func continueButtonPressed() {
        delegate?.continueButtonPressed()
    }
}
