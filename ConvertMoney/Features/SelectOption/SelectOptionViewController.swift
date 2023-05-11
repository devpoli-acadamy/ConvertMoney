import UIKit

protocol SelectOptionDelegate: AnyObject {
    func handleDidSelect(_ viewController: SelectOptionViewController, tag: Any)
}

final class SelectOptionViewController: UIViewController {

    // MARK: - Properties

    private lazy var customView: SelectOptionViewLogic = {
        let view = SelectOptionView(
            dataSource: self,
            delegate: self
        )
        return view
    }()

    // MARK: - Dependencies

    private lazy var viewModel: SelectOptionViewModelInput = {
        let viewModel = SelectOptionViewModel()
        viewModel.output = self
        return viewModel
    }()

    // MARK: - Properties

    private weak var delegate: SelectOptionDelegate?

    // MARK: - Initializer

    init(title: String, model: [CellModel], delegate: SelectOptionDelegate){
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
        self.title = title
        viewModel.setup(dataModel: model)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Layout

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
    }

    override func loadView() {
        view = customView
    }

    // MARK: - Private Methods

    private func configureNavigation(){
        navigationItem.setLeftBarButton(.init(title: "CANCELAR", style: .plain, target: self, action: #selector(handleCancelDidTap)), animated: true)
        navigationItem.title = title
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationController?.navigationBar.setupNavigationAppeareance(
            backgroundColor: .Neutral.color6,
            textColor: .Neutral.color7
        )
    }

    // MARK: - Action

    @objc private func handleCancelDidTap(){
        dismiss(animated: true)
    }

}

extension SelectOptionViewController: SelectOptionViewModelOutput {

    // MARK: - Public Methods
    func onSelectedModel(_ model: CellModel) {
        delegate?.handleDidSelect(self, tag: model.tag)
    }

}

extension SelectOptionViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectModel(index: indexPath.item)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)

        var configuration = cell.defaultContentConfiguration()
        configuration.text = viewModel.getTitle(from: indexPath.row)
        configuration.textProperties.font = .customFont(ofSize: 22)
        configuration.textProperties.color = .Neutral.color7

        cell.backgroundColor = .clear
        cell.contentConfiguration = configuration
        cell.selectionStyle = .none

        return cell
    }

}
