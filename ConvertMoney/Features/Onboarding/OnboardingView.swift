//
//  OnboardingView.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 10/04/23.
//

import UIKit

protocol OnboardingLogic: UIView {

}

protocol OnboardingDelegate: AnyObject {
    func onStartDidTap()
}

final class OnboardingView: ViewCode, OnboardingLogic {

    // MARK: - Components

    private lazy var topStackView: UIStackView = {
        return UIStackView([
            topImageView,
            appNameLabel
        ], axis: .vertical, distribution: .fill, alignment: .center, spacing: 8)
    }()

    private lazy var topImageView: UIImageView = {
        let imageView = UIImageView(image: .onboardingImg)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Convert\nMoney"
        label.numberOfLines = 0
        label.textColor = .Neutral.color6
        label.textAlignment = .center
        label.font = .customFont(ofSize: 32, weight: .bold)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()

    // MARK: Footer

    private lazy var containerFooterView: UIView = {
        let view = UIView()
        view.backgroundColor = .Neutral.color6
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()

    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView([titleLabel, descriptionLabel, startButton],
                    axis: .vertical,
                    distribution: .fill,
                    alignment: .fill,
                    spacing: 22
        )
        stackView.setCustomSpacing(42, after: descriptionLabel)
        return stackView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá,\nvamos economizar?"
        label.numberOfLines = 0
        label.textColor = .Neutral.color7
        label.font = .customFont(ofSize: 32, weight: .bold)
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Nunca foi tão fácil saber o seu saldo e se você consegue comprar aquele produto desejado"
        label.numberOfLines = 0
        label.textColor = .Neutral.color7
        label.font = .customFont(ofSize: 16)
        return label
    }()

    private lazy var startButton: DPButton = {
        let button = DPButton(action: .init(title: "COMEÇAR", handler: { [delegate] _ in
            delegate?.onStartDidTap()
        }))
        return button
    }()

    // MARK: - Properties

    private weak var delegate: OnboardingDelegate?

    // MARK: - Initialize

    init(delegate: OnboardingDelegate){
        self.delegate = delegate
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Layout

    override func setupViews() {
        addSubview(topStackView)
        addSubview(containerFooterView)
        containerFooterView.addSubview(containerStackView)
    }

    override func setupConstraints() {
        topStackView.layout(of: [
            topStackView.topAnchor.constraint(greaterThanOrEqualTo: safeTopAnchor, constant: 24),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])

        topImageView.layout(of: [
            topImageView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16),
            topImageView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            topImageView.widthAnchor.constraint(greaterThanOrEqualToConstant: 150),
            topImageView.heightAnchor.constraint(equalTo: topImageView.widthAnchor, multiplier: 9/21)
        ])

        containerStackView.filledSafeSuperview(.init(top: 42, left: 32, bottom: 50, right: 32))

        containerFooterView.layout(of: [
            containerFooterView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerFooterView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerFooterView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    override func setupExtras() {
        backgroundColor = .Brand.color3
    }

}
