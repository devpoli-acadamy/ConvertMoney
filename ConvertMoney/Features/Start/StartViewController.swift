import UIKit

final class StartViewController: UIViewController {

    // MARK: - Properties

    private lazy var customView: StartViewLogic = {
        let view = StartView(delegate: self)
        return view
    }()

    // MARK: - Dependencies

    private lazy var viewModel: StartViewModelInput = {
        let viewModel = StartViewModel()
        viewModel.output = self
        return viewModel
    }()

    // MARK: - Layout

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }

    override func loadView() {
        view = customView
    }

    // MARK: - Private Methods

    private func setupNavigation(){
        navigationController?.navigationBar.setupNavigationAppeareance(
            backgroundColor: .Neutral.color6,
            textColor: .Neutral.color7
        )
        navigationItem.setRightBarButton(.init(
            title: "Pular",
            style: .plain,
            target: self,
            action: #selector(handleSkipTap)
        ), animated: true)
    }

    // MARK: - Action

    @objc private func handleSkipTap(){
        print("SKIP")
    }
}

extension StartViewController: StartViewModelOutput {

    // MARK: - Public Methods

}

extension StartViewController: StartViewDelegate {

    func handleCurrencyDidTap() {
        let viewController = SelectOptionViewController(
            title: "Selecione uma opção",
            model: [
                .init(
                    title: "Dólar",
                    tag: "USD"
                ),
                .init(
                    title: "Euro",
                    tag: "EUR"
                ),
                .init(
                    title: "Guaraní",
                    tag: "PYG"
                )
            ],
            delegate: self
        )
        let navController = UINavigationController(rootViewController: viewController)
        if let sheet = navController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.selectedDetentIdentifier = .medium
        }
        present(navController, animated: true)
    }

}

extension StartViewController: SelectOptionDelegate {

    func handleDidSelect(_ viewController: SelectOptionViewController, tag: Any) {
        customView.setCurrencyInfo(value: tag as? String ?? "")
        viewController.dismiss(animated: true)
    }

}
