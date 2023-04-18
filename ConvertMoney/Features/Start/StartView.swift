
import UIKit

protocol StartViewLogic: UIView {

}

final class StartView: ViewCode, StartViewLogic {

    // MARK: - Components

    private lazy var moneyInput: DPInput = {
        let input = DPInput(title: "Valor do saldo")
        input.text = "R$ 0,00"
        return input
    }()

    // MARK: - Properties    

    // MARK: - Layout

    override func setupViews() {
        addSubview(moneyInput)
    }

    override func setupConstraints() {
        moneyInput.layout(of: [
            moneyInput.centerYAnchor.constraint(equalTo: centerYAnchor),
            moneyInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            moneyInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    override func setupExtras() {
        backgroundColor = .Neutral.color6
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

}
