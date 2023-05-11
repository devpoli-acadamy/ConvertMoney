
import UIKit

protocol SelectOptionViewLogic: UIView {

}

final class SelectOptionView: ViewCode, SelectOptionViewLogic {

    // MARK: - Components

    private lazy var contentTableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.backgroundColor = .clear
        return tableView
    }()

    init(
        dataSource: UITableViewDataSource,
        delegate: UITableViewDelegate
    ) {
        super.init()
        contentTableView.dataSource = dataSource
        contentTableView.delegate = delegate
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Layout

    override func setupViews() {
        addSubview(contentTableView)
    }

    override func setupConstraints() {
        contentTableView.filledSuperview()
    }

    override func setupExtras() {
        backgroundColor = .Neutral.color6
    }

}
