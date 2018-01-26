//
//  MasterVC.swift
//  UI Templates
//
//  Created by B_Litwin on 1/10/18.
//  Copyright © 2018 B_Litwin. All rights reserved.
//
//1 . create variable
//2 . name bundle identifier 
//3 . put in childVCs 
//4 . change name in Name protocol

import UIKit

class MasterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        changeViewController(index: 0)
    }
    
    func childVCs() -> [ChildVC] {
        return  [Red, Green, Orange]
    }
    
    func changeViewController(index: Int) {
        let childVC = childVCs()[index]
        guard let viewController = childVC as? UIViewController else { return }
        add(asChildViewController: viewController)
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        
        if !self.childViewControllers.isEmpty {
            let currentVC = self.childViewControllers[0]
            remove(asChildViewController: currentVC)
        }
        
        addChildViewController(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }

    lazy var Red: RedViewController = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "Red") as! RedViewController
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    lazy var Green: GreenViewController = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "Green") as! GreenViewController
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    lazy var Orange: OrangeViewController = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "Orange") as! OrangeViewController
        self.add(asChildViewController: viewController)
        return viewController
    }()
    

}


protocol ChildVC {
    var displayTitle: String { get }
}

extension ChildVC where Self: UIViewController {
    var displayTitle: String {
        return self.title!
    }
}


class RedViewController: UIViewController, ChildVC {
    override func viewDidLoad() {
        self.title = "Red"
        view.backgroundColor = UIColor.red
    }
}



class GreenViewController: UIViewController, ChildVC {
    override func viewDidLoad() {
        self.title = "Green"
        view.backgroundColor = UIColor.green
    }
}


class OrangeViewController: UIViewController, ChildVC {
    override func viewDidLoad() {
        self.title = "Orange"
        view.backgroundColor = UIColor.orange
    }
}



















