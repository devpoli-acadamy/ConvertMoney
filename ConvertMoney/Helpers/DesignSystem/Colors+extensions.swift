//
//  Colors+extensions.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 10/04/23.
//

import UIKit

extension UIColor {

    enum Brand {
        /// #DB504A
        static let color1: UIColor = .init(r: 219, g: 80, b: 74)   // rgba(219, 80, 74, 1)
        static let color2: UIColor = .init(r: 255, g: 111, b: 89)  // rgba(255, 111, 89, 1)
        /// #254441
        static let color3: UIColor = .init(r: 37, g: 68, b: 65)    // rgba(37, 68, 65, 1)
        ///
        static let color4: UIColor = .init(r: 67, g: 170, b: 139)  // rgba(67, 170, 139, 1)
        static let color5: UIColor = .init(r: 178, g: 176, b: 155) // rgba(178, 176, 155, 1)
    }

    enum Neutral {
        static let color6: UIColor = .init(r: 245, g: 245, b: 245) // rgba(245, 245, 245, 1)
        static let color7: UIColor = .init(r: 15, g: 27, b: 25) // rgba(15, 27, 25, 1)
    }

    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(
            red: r / 255,
            green: g / 255,
            blue: b / 255,
            alpha: a
        )
    }

}
