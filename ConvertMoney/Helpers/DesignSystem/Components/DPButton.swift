//
//  DPButton.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 05/04/23.
//

import UIKit

final class DPButton: UIButton {

    init(action: UIAction){
        super.init(frame: .zero)

        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .Brand.color1
        config.buttonSize = .large
        config.cornerStyle = .capsule
        config.baseForegroundColor = .Neutral.color6

        var container = AttributeContainer()
        container.font = .customFont(ofSize: 14, weight: .bold)
        container.foregroundColor = .Neutral.color6
        config.attributedTitle = AttributedString(action.title, attributes: container)

        configuration = config

        addAction(action, for: .touchUpInside)

        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 45).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

}
