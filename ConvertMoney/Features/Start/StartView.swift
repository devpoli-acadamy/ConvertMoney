
import UIKit

protocol StartViewLogic: UIView {

}

final class StartView: ViewCode, StartViewLogic {

    // MARK: - Components

    private lazy var currencyInput: DPInput = {
        let input = DPInput(title: "Moeda de conversão")
        input.text = "USD"
        input.addDropAction(target: self, action: #selector(onDidDropTap))
        return input
    }()

    private lazy var moneyInput: DPInput = {
        let input = DPInput(title: "Valor do saldo")
        input.keyboardType = .numberPad
        input.text = "R$ 0,00"
        return input
    }()

    private lazy var startButton: DPButton = {
        DPButton(action: .init(title: "Começar", handler: { _ in
            print("Começar")
        }))
    }()

    // MARK: - Properties    

    // MARK: - Layout

    override func setupViews() {
        addSubview(currencyInput)
        addSubview(moneyInput)
        addSubview(startButton)
    }

    override func setupConstraints() {
        currencyInput.layout(of: [
            currencyInput.bottomAnchor.constraint(equalTo: moneyInput.topAnchor, constant: -16),
            currencyInput.leadingAnchor.constraint(equalTo: moneyInput.leadingAnchor),
            currencyInput.trailingAnchor.constraint(equalTo: moneyInput.trailingAnchor)
        ])

        moneyInput.layout(of: [
            moneyInput.centerYAnchor.constraint(equalTo: centerYAnchor),
            moneyInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            moneyInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])

        startButton.layout(of: [
            startButton.topAnchor.constraint(equalTo: moneyInput.bottomAnchor, constant: 16),
            startButton.leadingAnchor.constraint(equalTo: moneyInput.leadingAnchor),
            startButton.trailingAnchor.constraint(equalTo: moneyInput.trailingAnchor)
        ])
    }

    override func setupExtras() {
        backgroundColor = .Neutral.color6
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    // MARK: - Actions

    @objc private func onDidDropTap(){
        print("teste")
        currencyInput.text = "EUR"
    }

}
