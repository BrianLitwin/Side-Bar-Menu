//
//  WindowManager.swift
//  UI Templates
//
//  Created by B_Litwin on 1/10/18.
//  Copyright © 2018 B_Litwin. All rights reserved.
//

import UIKit


protocol UsesWindowManager { }

class WindowManager {

    init() { }
    
    var currentView: WindowAnimation?
    
    func display(_ animation: WindowAnimation) {
        resignCurrentView()
        currentView = animation
        animation.display()
    }
    
    func resignCurrentView() {
        currentView?.resign()
    }
    
}



enum WindowAnimation {
    
    case fromBottom(height: CGFloat, view: UIView)
    case fromRight(width: CGFloat, view: UIView)
    
    var window: UIWindow {
        return UIApplication.shared.keyWindow!
    }
    
    var startFrame: (frame: CGRect, view: UIView) {
        switch self {
        case .fromBottom( _ , let view):
            let startFrame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 0)
            return (startFrame, view)
        case .fromRight( _  , let view):
            let startFrame = CGRect(x: window.frame.width, y: 0, width: 0, height: window.frame.height)
            return (startFrame, view)
        }
    }

    var displayFrame: CGRect {
        
        switch self {
        case .fromRight(let width, _ ):
            let x = window.frame.width - width
            return CGRect(x: x, y: 0, width: width, height: window.frame.height)
            
        case .fromBottom(let height, _ ):
            let y = window.frame.height - height
            return CGRect(x: 0, y: y, width: window.frame.width, height: height)
            
        }
        
    }
    
    func display() {
        
        let s = startFrame
        window.addSubview(s.view)
        s.view.frame = s.frame
        let dFrame = displayFrame
        UIView.animate(withDuration: 0.4, animations: {
            s.view.frame = dFrame
        })
    }
    
    func resign() {
        let s = startFrame
        UIView.animate(withDuration: 0.4, animations: {
            s.view.frame = s.frame
        })
        
    }
    
}



extension UIViewController {
    
    func getWindowManagerFromNavControl() -> WindowManager? {
        if let navControl = self.navigationController as? NavigationController {
            return navControl.windowManager
        } else {
            return nil
        }
    }
    
}


























