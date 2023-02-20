//
//  UserView.swift
//  GitPeek
//
//  Created by Ashish Badak on 20/02/23.
//

import UIKit

final class UserView: UIView {
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.constrain(height: 40, width: 40)
        imageView.roundCorners(radius: 20)
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 12
        view.alignment = .center
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
        stackView.addArrangedSubview(avatarImageView)
        stackView.addArrangedSubview(titleLabel)
        addSubview(stackView)
        stackView.layoutConstraints(to: self)
    }
    
    func setData(viewModel: UserViewModel) {
        titleLabel.text = viewModel.username
        avatarImageView.setImage(withURL: viewModel.avatarURL(sizedTo: 40))
    }
}

