
import UIKit

protocol StartViewLogic: UIView {
    func setCurrencyInfo(value: String)
}

protocol StartViewDelegate: AnyObject {
    func handleCurrencyDidTap()
}

final class StartView: ViewCode, StartViewLogic {

    // MARK: - Components

    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Antes de começar,\npreencha as informações"
        label.numberOfLines = 0
        label.textColor = .Neutral.color7
        label.font = .customFont(ofSize: 28, weight: .bold)
        return label
    }()

    private lazy var currencyInput: DPInput = {
        let input = DPInput(title: "Moeda de conversão")
        input.text = "USD"
        input.addDropAction(target: self, action: #selector(onDidDropTap))
        return input
    }()

    private lazy var moneyInput: DPInput = {
        let input = DPInput(title: "Valor do saldo")
        input.isMoney = true
        input.minValue = 0
        input.maxValue = 999_999_999
        input.text = ""
        return input
    }()

    private lazy var startButton: DPButton = {
        DPButton(action: .init(title: "Começar", handler: { [unowned self] _ in
            print("Começar: \(self.currencyInput.text) - \(self.moneyInput.value) - \(self.moneyInput.text)")
        }))
    }()

    // MARK: - Properties    

    private weak var delegate: StartViewDelegate?

    init(delegate: StartViewDelegate) {
        self.delegate = delegate
        super.init()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Layout

    override func setupViews() {
        addSubview(headerLabel)
        addSubview(currencyInput)
        addSubview(moneyInput)
        addSubview(startButton)
    }

    override func setupConstraints() {
        headerLabel.layout(of: [
            headerLabel.topAnchor.constraint(equalTo: safeTopAnchor, constant: 22),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
        ])

        currencyInput.layout(of: [
            currencyInput.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 62),
            currencyInput.leadingAnchor.constraint(equalTo: moneyInput.leadingAnchor),
            currencyInput.trailingAnchor.constraint(equalTo: moneyInput.trailingAnchor)
        ])

        moneyInput.layout(of: [
            moneyInput.topAnchor.constraint(equalTo: currencyInput.bottomAnchor, constant: 4),
            moneyInput.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            moneyInput.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor)
        ])

        startButton.layout(of: [
            startButton.leadingAnchor.constraint(equalTo: moneyInput.leadingAnchor),
            startButton.trailingAnchor.constraint(equalTo: moneyInput.trailingAnchor),
            startButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -50)
        ])
    }

    override func setupExtras() {
        backgroundColor = .Neutral.color6
    }

    // MARK: - Public Methods

    func setCurrencyInfo(value: String) {
        currencyInput.text = value
    }

    // MARK: - Private Methods

    // MARK: - Actions

    @objc private func onDidDropTap(){
        delegate?.handleCurrencyDidTap()
    }

}
