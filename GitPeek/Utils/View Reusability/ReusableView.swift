//
//  ReusableView.swift
//  GitPeek
//
//  Created by Ashish Badak on 18/02/23.
//

import UIKit

protocol ReusableView: AnyObject { }

extension ReusableView where Self: UIView {
    static var reuseId: String { String(describing: self) }
}

extension UITableViewCell: ReusableView { }
