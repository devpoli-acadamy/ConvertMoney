//
//  DPInput.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 17/04/23.
//

import UIKit

final class DPInput: ViewCode {

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView([
            titleLabel,
            inputTextField
        ],
                                axis: .vertical,
                                distribution: .fill,
                                alignment: .fill,
                                spacing: 4
        )
        return stack
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .Neutral.color7
        label.font = .customFont(ofSize: 16)
        return label
    }()

    private lazy var inputTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.font = .customFont(ofSize: 22, weight: .bold)
        textField.backgroundColor = .init(r: 239, g: 255, b: 250)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor(r: 37, g: 68, b: 65).cgColor
        textField.layer.borderWidth = 1
        textField.keyboardType = .default
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        return textField
    }()

    // MARK: - Properties

    var text: String? {
        set(newValue) {
            inputTextField.text = newValue
        }
        get {
            inputTextField.text
        }
    }

    var keyboardType: UIKeyboardType {
        set(newValue) {
            inputTextField.keyboardType = newValue
        }
        get {
            inputTextField.keyboardType
        }
    }

    var textContentType: UITextContentType {
        set(newValue){
            inputTextField.textContentType = newValue
        }
        get {
            inputTextField.textContentType
        }
    }

    var autocapitalizationType: UITextAutocapitalizationType {
        set(newValue){
            inputTextField.autocapitalizationType = newValue
        }
        get {
            inputTextField.autocapitalizationType
        }
    }

    var delegate: UITextFieldDelegate? {
        set(newValue) {
            inputTextField.delegate = newValue
        }
        get{
            inputTextField.delegate
        }
    }

    // MARK: - Initializer

    convenience init(title: String) {
        self.init()
        updateTitle(title)
    }

    // MARK: - Layout

    override func setupViews() {
        addSubview(contentStackView)
    }

    override func setupConstraints() {
        contentStackView.filledSuperview()
    }

    override func setupExtras() {
        backgroundColor = .clear
    }

    // MARK: - Public Methods

    func updateTitle(_ title: String){
        titleLabel.text = title
    }

}

