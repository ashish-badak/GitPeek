//
//  ActivityStateViewController.swift
//  GitPeek
//
//  Created by Ashish Badak on 21/02/23.
//

import UIKit

final class ActivityStateViewController: UIViewController {
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(style: .medium)
        activityView.hidesWhenStopped = true
        return activityView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func willMove(toParent parent: UIViewController?) {
        if parent == nil {
            removeActivityIndicator()
        }
    }
    
    override func didMove(toParent parent: UIViewController?) {
        if parent != nil {
            showActivityIndicator()
        }
    }
    
    deinit {
        removeActivityIndicator()
    }
    
    private func showActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.center = self.view.center
            self.activityIndicator.startAnimating()
            self.view.addSubview(self.activityIndicator)
        }
    }
    
    private func removeActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
        }
    }
}
