//
//  HistoryHeader.swift
//  prostoKava
//
//  Created by Vladimir Kovalev on 10.05.2023.
//

import UIKit

class HistoryHeader: UICollectionReusableView {
    //MARK: - Proeprties
    
    lazy private var historySelector: UISegmentedControl = {
        
        let items = ["First", "Second"]
        let sc = UISegmentedControl(items: items)
        sc.frame = CGRect(x: self.frame.midX - self.frame.width/2 + 10 , y: self.frame.midY - 20, width: self.frame.width - 20, height: 40)
        //        control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHeader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureHeader() {
        addSubview(historySelector)
        NSLayoutConstraint.activate([
            historySelector.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            historySelector.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
