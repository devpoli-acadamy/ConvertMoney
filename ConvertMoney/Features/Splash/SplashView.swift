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

    // MARK: - Layout

    override func setupViews() {

    }

    override func setupConstraints() {
        backgroundColor = .red
    }

}
