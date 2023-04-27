//
//  UINavigationBar+Extensions.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 26/04/23.
//

import UIKit

extension UINavigationBar {

    func setupNavigationAppeareance(
        backgroundColor: UIColor,
        textColor: UIColor
    ){
        let customAppeareance = UINavigationBarAppearance()
        customAppeareance.configureWithOpaqueBackground()
        customAppeareance.backgroundColor = backgroundColor
        customAppeareance.shadowColor = .clear
        customAppeareance.shadowImage = .init()

        let buttonAppeareance = customAppeareance.buttonAppearance.normal
        buttonAppeareance.titleTextAttributes = [
            .foregroundColor: textColor,
            .font: UIFont.customFont(ofSize: 14)
        ]

        let buttonHighlightedAppeareance = customAppeareance.buttonAppearance.highlighted
        buttonHighlightedAppeareance.titleTextAttributes = [
            .foregroundColor: textColor.withAlphaComponent(0.8),
            .font: UIFont.customFont(ofSize: 14)
        ]

        customAppeareance.largeTitleTextAttributes = [
            .foregroundColor: textColor,
            .font: UIFont.customFont(ofSize: 22, weight: .bold)
        ]

        // VERTICAL
        standardAppearance = customAppeareance
        // VERTICAL + SCROLL
        scrollEdgeAppearance = customAppeareance
    }

}
