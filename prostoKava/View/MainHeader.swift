//
//  MainHeader.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 09.05.2023.
//

import UIKit

private let reuseIdentifier = "TopCategoryCell"

protocol MainHeaderDelegate {
    func goToQRCode()
}

class MainHeader: UICollectionReusableView {
    //MARK: - Properties
    
    private var collectionView: UICollectionView?
    
    var delegate: MainHeaderDelegate?
    
    private let bonusView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.2235294118, green: 0.2117647059, blue: 0.2745098039, alpha: 1)
        view.layer.cornerRadius = 10

        return view
    }()
    
    lazy private var pointsLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.numberOfLines = 2
         let string = configureAttributedString()
         label.attributedText = string
         label.textAlignment = .left
         return label
     }()
    
  lazy  private var qrCodeImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "qrBig")
        iv.backgroundColor = .white
      iv.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(test))
        iv.addGestureRecognizer(gestureRecognizer)
        
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    private let newsAndSalesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "News and Sales"
        
        return label
    }()
    
    private let foodsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Food"
        
        return label
    }()
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureAttributedString() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "30\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 24)])
        attributedText.append(NSAttributedString(string: "Your balance", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white]))
        return attributedText
    }
    
    func configureCollectionView() {
        
        backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9333333333, blue: 0.8784313725, alpha: 1)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: CGRect(x: 10, y: frame.maxY - 240, width: self.frame.width, height: 200), collectionViewLayout: layout)
        
        collectionView!.delegate = self
        collectionView!.dataSource = self
        
        collectionView!.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9333333333, blue: 0.8784313725, alpha: 1)
        collectionView!.register(TopCategoryCell.self, forCellWithReuseIdentifier: "TopCategoryCell")
        
        self.addSubview(collectionView!)
        
        addSubview(bonusView)
        NSLayoutConstraint.activate([
            bonusView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bonusView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            bonusView.heightAnchor.constraint(equalToConstant: 120),
            bonusView.widthAnchor.constraint(equalToConstant: self.frame.width - 20)
        ])
        
        bonusView.addSubview(pointsLabel)
        NSLayoutConstraint.activate([
            pointsLabel.leftAnchor.constraint(equalTo: bonusView.leftAnchor, constant: 12),
            pointsLabel.topAnchor.constraint(equalTo: bonusView.topAnchor, constant: 12)
        ])
        
        bonusView.addSubview(qrCodeImageView)
        NSLayoutConstraint.activate([
            qrCodeImageView.centerYAnchor.constraint(equalTo: bonusView.centerYAnchor),
            qrCodeImageView.rightAnchor.constraint(equalTo: bonusView.rightAnchor, constant: -12),
            qrCodeImageView.widthAnchor.constraint(equalToConstant: 100),
            qrCodeImageView.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        addSubview(newsAndSalesLabel)
        NSLayoutConstraint.activate([
            newsAndSalesLabel.topAnchor.constraint(equalTo: bonusView.bottomAnchor, constant: 12),
            newsAndSalesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12)
        ])
        
        addSubview(foodsLabel)
        NSLayoutConstraint.activate([
            foodsLabel.topAnchor.constraint(equalTo: collectionView!.bottomAnchor, constant: 6),
            foodsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12)
        ])
        
    }
    
    //MARK: - Selectors
    
    @objc func test() {
        delegate?.goToQRCode()
    }
}

//MARK: - UICollectionViewDelegate & UICollectionViewDataSource

extension MainHeader: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCategoryCell", for: indexPath) as! TopCategoryCell
        return cell
    }

    
}

extension MainHeader: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 250, height: 150)
        return size
    }
}
