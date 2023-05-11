//
//  MenuViewController.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 09.05.2023.
//

import UIKit

private let reuseIdentifier = "MenuCell"

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: - Properties
    
    private let tableView = UITableView()
    
    private let profileSubview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.2235294118, green: 0.2117647059, blue: 0.2745098039, alpha: 1)
        return view
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
    
    lazy private var greetLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.numberOfLines = 0
         let string = configureAttributedString()
         label.attributedText = string
         label.textAlignment = .left
         return label
     }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9333333333, blue: 0.8784313725, alpha: 1)
        configureUI()
        configureTableView()
    }
    
    //MARK: - Helpers
    
    func configureAttributedString() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "Hello, ", attributes: [.font: UIFont.boldSystemFont(ofSize: 24), .foregroundColor: UIColor.white])
        attributedText.append(NSAttributedString(string: "Vladimir\n", attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.green]))
        attributedText.append(NSAttributedString(string: "30 points", attributes: [.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.white]))
        return attributedText
    }
    
    func configureUI() {
        view.addSubview(profileSubview)
        NSLayoutConstraint.activate([
            profileSubview.topAnchor.constraint(equalTo: view.topAnchor),
            profileSubview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileSubview.widthAnchor.constraint(equalToConstant: view.frame.width),
            profileSubview.heightAnchor.constraint(equalToConstant: view.frame.height / 5)
        ])
        
        profileSubview.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.rightAnchor.constraint(equalTo: profileSubview.rightAnchor, constant: -12),
            profileImageView.bottomAnchor.constraint(equalTo: profileSubview.bottomAnchor, constant: -16)
        ])
        profileImageView.layer.cornerRadius = 35
        
        profileSubview.addSubview(greetLabel)
        NSLayoutConstraint.activate([
            greetLabel.leftAnchor.constraint(equalTo: profileSubview.leftAnchor, constant: 12),
            greetLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor)
        ])
    }
    
    func configureTableView() {
        tableView.register(ProfileOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9333333333, blue: 0.8784313725, alpha: 1)
        
        let frame = CGRect(x: 0, y: 170, width: view.frame.width, height: view.frame.height * 3/4)
        tableView.frame = frame
        
        view.addSubview(tableView)
        
    }
    
    //MARK: - Selectors
    
    @objc func goToProfile() {
        let vc = ProfileViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - UITableViewDelegate & UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ProfileOptionCell
        cell.isForMenu = true
        cell.indexPath = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}
