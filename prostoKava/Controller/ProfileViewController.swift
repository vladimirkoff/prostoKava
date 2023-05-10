//
//  ProfileViewController.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 09.05.2023.
//

import UIKit

private let reuseIdentifier = "ProfileOptionCell"

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK: - Properties
    
    lazy private var tableView = UITableView(frame: CGRect(x: 0, y: changeProfilePhotoButton.frame.maxY + view.frame.height / 3, width: view.frame.width, height: view.frame.height / 3))
    
    lazy private var changeProfilePhotoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 140).isActive = true
        button.widthAnchor.constraint(equalToConstant: 140).isActive = true
        button.layer.cornerRadius = 140 / 2
        return button
    }()
    
    lazy var saveButton: UIButton = {
         let button = UIButton()
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
         button.backgroundColor = #colorLiteral(red: 0.2235294118, green: 0.2117647059, blue: 0.2745098039, alpha: 1)
         button.setTitle("Save changes", for: .normal)
         button.layer.cornerRadius = 40
         button.tintColor = .white
         button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureUI()
        configureTableView()
    }
    
    //MARK: - Helpers
    
    func configureNavBar() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Edit profile"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(goBackButtonPressed))
    }
    
    func configureTableView() {
        tableView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9333333333, blue: 0.8784313725, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        
    }
    
    func configureUI() {
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9333333333, blue: 0.8784313725, alpha: 1)
        
        view.addSubview(tableView)

        view.addSubview(changeProfilePhotoButton)
        NSLayoutConstraint.activate([
            changeProfilePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeProfilePhotoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4)
        ])
        
        let frame = CGRect(x: view.frame.midX - 150, y: tableView.frame.maxY + 30, width: 300, height: 80)
        saveButton.frame = frame
        
        view.addSubview(saveButton)
        
        view.addSubview(phoneNumberLabel)
        NSLayoutConstraint.activate([
            phoneNumberLabel.centerXAnchor.constraint(equalTo: changeProfilePhotoButton.centerXAnchor),
            phoneNumberLabel.topAnchor.constraint(equalTo: changeProfilePhotoButton.bottomAnchor, constant: 6)
        ])
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ProfileOptionCell
        cell.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9333333333, blue: 0.8784313725, alpha: 1)
        return cell
    }
    
    //MARK: - Selectors
    
    @objc func goBackButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func chooseImage() {
        print("Choose image")
    }
    
    @objc func saveButtonPressed() {
        
    }
}

extension ProfileViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
