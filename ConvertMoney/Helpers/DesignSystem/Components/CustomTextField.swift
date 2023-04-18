//
//  CustomTextField.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 17/04/23.
//

import UIKit

final class CustomTextField: UITextField {

    var padding: UIEdgeInsets = .init(top: 16, left: 22, bottom: 16, right: 22)

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

}
