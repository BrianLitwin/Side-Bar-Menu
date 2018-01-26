//
//  Navigation Controller.swift
//  UI Templates
//
//  Created by B_Litwin on 1/10/18.
//  Copyright © 2018 B_Litwin. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    lazy var windowManager: WindowManager = {
        return WindowManager()
    }()
    
    var masterVC: MasterVC {
        return self.childViewControllers[0] as! MasterVC
    }
    
    lazy var sideBar: SideBar = {
        let sb = SideBar()
        sb.navController = self
        return sb
    }()
    
    override func viewDidLoad() {
        configureRightBarButton()
    }
    
    func configureRightBarButton() {
        let image = #imageLiteral(resourceName: "hamburger").withRenderingMode(.alwaysTemplate)
        let rightBarButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showMenu))
        navigationItem.rightBarButtonItem = rightBarButton
        navigationBar.items = [navigationItem]
        
    }
    
    @objc func showMenu() {
        let window = UIApplication.shared.keyWindow!
        let width = window.frame.width - 80
        let windowAnimation = WindowAnimation.fromRight(width: width, view: sideBar)
        windowManager.display(windowAnimation)
    }

}
