//
//  ProfileCell.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 11.05.2023.
//

import UIKit

class ProfileCell: UICollectionViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return dataArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       let row = dataArray[row]
       return row
    }
    
    //MARK: - Properties
    
    let dataArray = ["English", "Maths", "History", "German", "Science"]
    
    lazy var picker: UIPickerView = {
         let pv = UIPickerView()
         pv.translatesAutoresizingMaskIntoConstraints = false
         pv.delegate = self
         pv.dataSource = self
         return pv
     }()
    
    private let infoTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.font = UIFont.boldSystemFont(ofSize: 24)
        tv.textColor = .black
        tv.textAlignment = .left
        tv.keyboardType = .numberPad
        return tv
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
        backgroundColor = .white
//        addSubview(infoTextView)
//        NSLayoutConstraint.activate([
//            infoTextView.leftAnchor.constraint(equalTo: leftAnchor),
//            infoTextView.rightAnchor.constraint(equalTo: rightAnchor),
//            infoTextView.topAnchor.constraint(equalTo: topAnchor),
//            infoTextView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
        
//        addSubview(picker)
//        NSLayoutConstraint.activate([
//            picker.centerXAnchor.constraint(equalTo: centerXAnchor),
//            picker.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
        
        self.addSubview(picker)
        picker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        picker.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
}
