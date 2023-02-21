//
//  LoadingView.swift
//  GitPeek
//
//  Created by Ashish Badak on 21/02/23.
//

import UIKit

final class LoadingView: UIView {
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(style: .medium)
        activityView.hidesWhenStopped = true
        return activityView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(activityIndicator)
        activityIndicator.pinHorizontally()
        activityIndicator.constrainTop(bound: .view(8))
        activityIndicator.constrainBottom(bound: .view(8))
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview == nil {
            stopLoading()
        }
        super.willMove(toSuperview: newSuperview)
    }
    
    override func didMoveToSuperview() {
        if self.superview != nil {
            startLoading()
        }
        super.didMoveToSuperview()
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
    }
}
