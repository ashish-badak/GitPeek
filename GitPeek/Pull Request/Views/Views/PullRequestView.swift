//
//  PullRequestView.swift
//  GitPeek
//
//  Created by Ashish Badak on 20/02/23.
//

import UIKit

typealias PullRequestTableViewCell = TableViewCell<PullRequestView>

final class PullRequestView: UIView, CellCampatibleView {
    typealias ViewModel = PullRequestViewModel
    
    private lazy var userView: UserView = {
        let view = UserView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var creationTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var closureTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        view.alignment = .leading
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        stackView.addArrangedSubview(userView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(creationTimeLabel)
        stackView.addArrangedSubview(closureTimeLabel)
        addSubview(stackView)
        stackView.layoutConstraints(
            to: self,
            top: .view(16),
            leading: .view(16),
            bottom: .view(16),
            trailing: .view(16)
        )
    }
    
    func setData(_ viewModel: PullRequestViewModel) {
        userView.setData(viewModel: viewModel.userViewModel)
        titleLabel.text = viewModel.title
        creationTimeLabel.text = viewModel.creationTime
        closureTimeLabel.text = viewModel.closureTime
    }
}
