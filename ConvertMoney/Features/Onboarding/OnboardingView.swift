//
//  OnboardingView.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 10/04/23.
//

import UIKit

protocol OnboardingLogic: UIView {

}

final class OnboardingView: ViewCode, OnboardingLogic {

    // MARK: - Layout

    override func setupViews() {

    }

    override func setupConstraints() {

    }

    override func setupExtras() {
        backgroundColor = .Brand.color1
    }

}
