//
//  UIViewControllerExtension.swift
//  GitPeek
//
//  Created by Ashish Badak on 21/02/23.
//

import UIKit

extension UIViewController {
    func add(childViewController: UIViewController, parentView: UIView) {
        addChild(childViewController)
        parentView.addSubview(childViewController.view)
        childViewController.view.frame = parentView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
