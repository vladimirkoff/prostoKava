//
//  AuthViewController.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 09.05.2023.
//

import UIKit

class AuthViewController: UIViewController {
    //MARK: - Properties
    
    lazy private var customViewHeight = view.frame.height / 2 + 80
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "prosto_kava-removebg-preview")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy private var customView: CustomAuthView = {
        let view = CustomAuthView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var joinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let text = configureAttributedString()
        label.numberOfLines = 0
        label.attributedText = text
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    //MARK: - Helpers
    
    func configureAttributedString() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "Join prostoKava!\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 36)])
        attributedText.append(NSAttributedString(string: "\n", attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.white]))
        attributedText.append(NSAttributedString(string: "Type in your phone number to login", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white]))
        return attributedText
    }
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = #colorLiteral(red: 0.2235294118, green: 0.2117647059, blue: 0.2745098039, alpha: 1)
        
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -12),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: view.frame.height / 3 + 20),
            logoImageView.widthAnchor.constraint(equalToConstant: view.frame.width)
        ])
        
        view.addSubview(joinLabel)
        
        NSLayoutConstraint.activate([
            joinLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -40),
            joinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(customView)
        
        
        customView.frame = CGRect(x: 0, y: view.frame.height + customViewHeight , width: view.frame.width, height: customViewHeight)
        

        
            UIView.animate(withDuration: 1) {
                self.customView.frame = CGRect(x: 0 , y: self.view.frame.height - self.customViewHeight, width: self.view.frame.width, height: self.customViewHeight)
            }
    }
    

}

extension AuthViewController: CustomAuthViewDelegate {
    func continueButtonPressed() {
        let vc = MainTabBarController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
