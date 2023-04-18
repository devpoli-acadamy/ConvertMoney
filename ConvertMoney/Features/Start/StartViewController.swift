import UIKit

final class StartViewController: UIViewController {

    // MARK: - Properties

    private lazy var customView: StartViewLogic = {
        let view = StartView()
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
    }

    override func loadView() {
        view = customView
    }

    // MARK: - Private Methods

}

extension StartViewController: StartViewModelOutput {

    // MARK: - Public Methods

}