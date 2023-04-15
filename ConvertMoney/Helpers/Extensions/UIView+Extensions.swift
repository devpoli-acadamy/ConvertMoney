//
//  UIView+Extensions.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 10/04/23.
//

import UIKit

extension UIView {

    var safeTopAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.topAnchor
    }

    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.leadingAnchor
    }

    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.trailingAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.bottomAnchor
    }

    func layout(of constraints: [NSLayoutConstraint]){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }

    func filledSuperview(_ constant: UIEdgeInsets){
        guard let superview else { return }
        layout(of: [
            topAnchor.constraint(equalTo: superview.topAnchor, constant: constant.top),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant.left),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -constant.right),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant.bottom),
        ])
    }

    func filledSafeSuperview(_ constant: UIEdgeInsets){
        guard let superview else { return }
        layout(of: [
            topAnchor.constraint(equalTo: superview.safeTopAnchor, constant: constant.top),
            leadingAnchor.constraint(equalTo: superview.safeLeadingAnchor, constant: constant.left),
            trailingAnchor.constraint(equalTo: superview.safeTrailingAnchor, constant: -constant.right),
            bottomAnchor.constraint(equalTo: superview.safeBottomAnchor, constant: -constant.bottom),
        ])
    }

}

extension UIStackView {

    convenience init(
        _ arrangedSubviews: [UIView] = [],
        axis: NSLayoutConstraint.Axis = .vertical,
        distribution: Distribution = .fill,
        alignment: Alignment = .fill,
        spacing: CGFloat = 8
    ) {
        self.init()
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        self.axis = axis
        arrangedSubviews.forEach { v in
            self.addArrangedSubview(v)
        }
    }

}
