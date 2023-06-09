//
//  QRCodeViewController.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 09.05.2023.
//

import UIKit

class QRCodeViewController: UIViewController {
    //MARK: - Properties
    
    private var count = 0
    
    private let window = UIApplication.shared.windows.last!

    
    private var scanYPos: CGFloat = 0
    
    private let qrCodeImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "qrBig")
        return iv
    }()
    
    private let scanLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.green.cgColor
        view.layer.shadowOpacity = 10
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 20
        view.layer.cornerRadius = 6
        return view
    }()
    
   lazy private var pointsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        let string = configureAttributedString()
        label.attributedText = string
        label.textAlignment = .center
        return label
    }()
    
   lazy private var backgroundView: UIView = {

        let view = UIView(frame: window.bounds)
        view.backgroundColor = UIColor.black
        view.layer.opacity = 0.5
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        view.addGestureRecognizer(gestureRecognizer)
        
        return view
    }()
    
   lazy private var windowView: BonusProgramView = {
        let view = BonusProgramView(frame: CGRect(x: view.frame.midX - view.frame.width/2 + 15, y: view.frame.midY - view.frame.height/2 + 100, width: view.frame.width - 30, height: view.frame.height - 200))
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavBar()
    }
    
    //MARK: - Helpers
    
    func configureAttributedString() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "30\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 62), .foregroundColor: UIColor.black])
        attributedText.append(NSAttributedString(string: "Your balance", attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.black]))
        return attributedText
    }
    
    func configureNavBar() {
        navigationItem.title = "Customer's card"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "info"), style: .plain, target: self, action: #selector(infoButtonPressed))
    }
    
    func configureUI() {
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9333333333, blue: 0.8784313725, alpha: 1)
        view.addSubview(qrCodeImageView)
        NSLayoutConstraint.activate([
            qrCodeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            qrCodeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            qrCodeImageView.heightAnchor.constraint(equalToConstant: 300),
            qrCodeImageView.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        view.addSubview(pointsLabel)
        
        NSLayoutConstraint.activate([
            pointsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pointsLabel.topAnchor.constraint(equalTo: qrCodeImageView.bottomAnchor, constant: 12)
        ])
        
        view.addSubview(scanLine)
        
        let frame = CGRect(x: view.frame.width / 2 - 150, y: qrCodeImageView.frame.maxY + 100, width: 300, height: 10)
        
        scanYPos = qrCodeImageView.frame.maxY + 100
        
        scanLine.frame = frame
        
        let timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(animateScan), userInfo: nil, repeats: true)
    }
    
    @objc func animateScan() {
        if count == 0 {
            count = 1
            UIView.animate(withDuration: 1.5) {
                self.scanLine.frame = CGRect(x: self.view.frame.width / 2 - 150, y: self.scanYPos + 300, width: 300, height: 10)
            }
            
        } else {
            count = 0
            UIView.animate(withDuration: 1.5) {
                self.scanLine.frame = CGRect(x: self.view.frame.width / 2 - 150, y: self.scanYPos, width: 300, height: 10)
            }
        }
    }
    
    //MARK: - Selectors
    
    @objc func dismissView() {
        backgroundView.removeFromSuperview()
        
        
        UIView.animate(withDuration: 1) {
            self.windowView.removeFromSuperview()
        }
    }
    
    @objc func infoButtonPressed() {

        window.addSubview(backgroundView)
        window.addSubview(windowView)
        
    }
}
