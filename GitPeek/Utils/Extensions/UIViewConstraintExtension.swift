//
//  UIViewConstraintExtension.swift
//  GitPeek
//
//  Created by Ashish Badak on 18/02/23.
//

import Foundation
import UIKit

enum ConstraintBound {
    case safeArea(CGFloat)
    case view(CGFloat)
}

extension UIView {
    // - MARK: Edge constraints
    func layoutConstraints(
        to view: UIView? = nil,
        top: ConstraintBound = .view(0),
        leading: ConstraintBound = .view(0),
        bottom: ConstraintBound = .view(0),
        trailing: ConstraintBound = .view(0)
    ) {
        guard let view = view ?? superview else { return }
        
        constrainTop(to: view, bound: top)
        constrainLeading(to: view, bound: leading)
        constrainBottom(to: view, bound: bottom)
        constrainTrailing(to: view, bound: trailing)
    }
    
    func constrainTop(to view: UIView? = nil, bound: ConstraintBound? = .view(0)) {
        guard let view = view ?? superview, let bound = bound else {
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch bound {
        case .safeArea(let constant):
            topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: constant
            ).isActive = true
        case .view(let constant):
            topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: constant
            ).isActive = true
        }
    }
    
    func constrainLeading(to view: UIView? = nil, bound: ConstraintBound? = .view(0)) {
        guard let view = view ?? superview, let bound = bound else {
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch bound {
        case .safeArea(let constant):
            leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: constant
            ).isActive = true
        case .view(let constant):
            leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: constant
            ).isActive = true
        }
    }
    
    func constrainBottom(to view: UIView? = nil, bound: ConstraintBound? = .view(0)) {
        guard let view = view ?? superview, let bound = bound else {
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch bound {
        case .safeArea(let constant):
            bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -constant
            ).isActive = true
        case .view(let constant):
            bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: -constant
            ).isActive = true
        }
    }
    
    func constrainTrailing(to view: UIView? = nil, bound: ConstraintBound? = .view(0)) {
        guard  let view = view ?? superview, let bound = bound else {
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch bound {
        case .safeArea(let constant):
            trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -constant
            ).isActive = true
        case .view(let constant):
            trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -constant
            ).isActive = true
        }
    }
    
    // - MARK: Size constraints
    func constrain(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if height > 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width > 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
    
    func constrain(height: CGFloat) {
        guard height > 0 else { return }
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func constrain(width: CGFloat) {
        guard width > 0 else { return }
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    // - MARK: Center constraints
    func pinToCenter(wrt view: UIView? = nil) {
        guard let view = view ?? superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func pinVertically(wrt view: UIView? = nil) {
        guard let view = view ?? superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func pinHorizontally(wrt view: UIView? = nil) {
        guard let view = view ?? superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension UIView {
    func roundCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func setBorder(
        color: UIColor = .systemGray,
        size: CGFloat = 1
    ) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = size
    }
}
