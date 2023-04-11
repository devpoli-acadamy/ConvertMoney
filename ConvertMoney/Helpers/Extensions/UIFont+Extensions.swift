//
//  UIFont+Extensions.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 10/04/23.
//

import UIKit

extension UIFont {

    enum CustomWeight {
        case regular
        case bold

        func getName() -> String {
            switch self {
            case .regular:
                return "Regular"
            case .bold:
                return "Bold"
            }
        }
    }

    class func customFont(ofSize size: CGFloat, weight: CustomWeight = .regular) -> UIFont {
        guard let font = UIFont(name: "SFProDisplay-\(weight.getName())", size: size) else {
            return .systemFont(ofSize: size)
        }
        return font
    }

}
