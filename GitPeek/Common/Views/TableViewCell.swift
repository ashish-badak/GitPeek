//
//  TableViewCell.swift
//  GitPeek
//
//  Created by Ashish Badak on 20/02/23.
//

import UIKit

protocol CellCampatibleView: UIView {
    associatedtype ViewModel
    func setData(_ viewModel: ViewModel)
}

final class TableViewCell<View: CellCampatibleView>: UITableViewCell {
    private lazy var view: View = {
        let view = View()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(view)
        view.layoutConstraints()
    }
    
    func setData(_ viewModel: View.ViewModel) {
        view.setData(viewModel)
    }
}
