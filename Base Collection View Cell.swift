//
//  Base Collection View Cell.swift
//  Side Menu Bar
//
//  Created by B_Litwin on 1/26/18.
//  Copyright © 2018 B_Litwin. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    var headerText: String =  "" {
        didSet {
            headerLabel.text = headerText
        }
    }
    
    var headerLabel: UILabel = {
        let l = UILabel()
        return l
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                itemSelected()
            } else {
                itemDeselected()
            }
        }
    }
    
    func itemSelected() {
        
    }
    
    func itemDeselected() {
        
    }
    
}
