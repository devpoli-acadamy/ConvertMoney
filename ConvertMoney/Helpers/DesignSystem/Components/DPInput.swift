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
            inputTextField,
            dropContentView
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
        textField.textColor = .Brand.color3
        textField.backgroundColor = .init(r: 239, g: 255, b: 250)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor(r: 37, g: 68, b: 65).cgColor
        textField.layer.borderWidth = 1
        textField.keyboardType = .default
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        textField.addTarget(self, action: #selector(handleInputDidChange), for: .editingChanged)
        return textField
    }()

    private lazy var dropContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(r: 239, g: 255, b: 250)
        view.layer.cornerRadius = 12
        view.layer.borderColor = UIColor(r: 37, g: 68, b: 65).cgColor
        view.layer.borderWidth = 1
        view.addSubview(dropValueLabel)
        view.addSubview(dropArrowImage)
        return view
    }()

    private lazy var dropValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .Brand.color3
        label.font = .customFont(ofSize: 22, weight: .bold)
        return label
    }()

    private lazy var dropArrowImage: UIImageView = {
        let imageView = UIImageView(image: .arrowRight)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .Brand.color5
        return imageView
    }()

    // MARK: - Properties

    var text: String? {
        set(newValue) {
            inputTextField.text = newValue
            dropValueLabel.text = newValue
            handleInputDidChange()
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

    override var inputView: UIView? {
        set(newValue){
            inputTextField.inputView = newValue
        }
        get{
            inputTextField.inputView
        }
    }

    private(set) var isDropDown: Bool = false {
        didSet{
            dropContentView.isHidden = !isDropDown
            inputTextField.isHidden = isDropDown
        }
    }

    var isMoney: Bool = false {
        didSet {
            if isMoney {
                keyboardType = .numberPad
                handleInputDidChange()
            }
        }
    }

    var maxValue: Double = .infinity
    var minValue: Double = .zero
    var value: String? {
        text?.filter { c in "0"..."9" ~= c }
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

        dropValueLabel.layout(of: [
            dropValueLabel.topAnchor.constraint(equalTo: dropContentView.topAnchor, constant: 16),
            dropValueLabel.leadingAnchor.constraint(equalTo: dropContentView.leadingAnchor, constant: 22),
            dropValueLabel.trailingAnchor.constraint(equalTo: dropArrowImage.leadingAnchor, constant: -12),
            dropValueLabel.bottomAnchor.constraint(equalTo: dropContentView.bottomAnchor, constant: -16),
        ])

        dropArrowImage.layout(of: [
            dropArrowImage.heightAnchor.constraint(equalToConstant: 24),
            dropArrowImage.widthAnchor.constraint(equalTo: dropArrowImage.heightAnchor),
            dropArrowImage.centerYAnchor.constraint(equalTo: dropContentView.centerYAnchor),
            dropArrowImage.trailingAnchor.constraint(equalTo: dropContentView.trailingAnchor, constant: -12)
        ])
    }

    override func setupExtras() {
        backgroundColor = .clear
        isDropDown = false
    }

    // MARK: - Public Methods

    func updateTitle(_ title: String){
        titleLabel.text = title
    }

    func addDropAction(target: Any?, action: Selector?){
        isDropDown = true
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        dropContentView.addGestureRecognizer(tapGesture)
    }

    // MARK: - Actions

    @objc private func handleInputDidChange(){
        guard isMoney else {
            return
        }
        let value = Double(value ?? "")
        let newValue = (value ?? 0.0) / 100
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let masked = formatter.string(from: NSNumber(value: min(max(newValue, minValue), maxValue)))
        inputTextField.text = masked

    }

}
