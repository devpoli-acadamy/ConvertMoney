//
//  SplashView.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 05/04/23.
//

import UIKit

protocol SplashLogic: UIView {

}

final class SplashView: ViewCode, SplashLogic {

    private lazy var loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .Neutral.color6
        view.startAnimating()
        return view
    }()

    private lazy var loadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Carregando..."
        label.numberOfLines = 0
        label.textColor = .Neutral.color6
        label.font = .customFont(ofSize: 22, weight: .bold)
        return label
    }()

    private lazy var contentStackView: UIStackView = {
        return UIStackView([
            loadingView,
            loadingLabel
        ], alignment: .center, spacing: 10)
    }()

    // MARK: - Layout

    override func setupViews() {
        addSubview(contentStackView)
    }

    override func setupConstraints() {
        contentStackView.layout(of: [
            contentStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: safeLeadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: safeTrailingAnchor)
        ])
    }

    override func setupExtras() {
        backgroundColor = .Brand.color3
    }

}
