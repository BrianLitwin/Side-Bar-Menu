//
//  SideBar.swift
//  UI Templates
//
//  Created by B_Litwin on 1/10/18.
//  Copyright © 2018 B_Litwin. All rights reserved.
//

import UIKit


class SideBar: BaseCollectionView {
    
    var navController: NavigationController!
    var displayTextColor: [UIColor] = [.red, .green, .orange]
    
    var windowManager: WindowManager {
        return navController.windowManager
    }
    
    var masterVC: MasterVC {
        return navController.masterVC
    }
    
    override var numberOfItemsInSection: Int {
        return masterVC.childVCs().count
    }
    
    override func setup() {
        register(SideBarCell.self, forCellWithReuseIdentifier: reuseID)
        contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath) as! SideBarCell
        cell.headerText = masterVC.childVCs()[indexPath.row].displayTitle
        cell.headerLabel.textColor = displayTextColor[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        masterVC.changeViewController(index: indexPath.row)
        windowManager.resignCurrentView()
    }
    
}

class SideBarCell: BaseCollectionViewCell {
    
    override func setupViews() {
        contentView.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        headerLabel.textColor = UIColor.gray
    }
    
}
