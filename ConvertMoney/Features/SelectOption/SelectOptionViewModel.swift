import UIKit

protocol SelectOptionViewModelInput {
    var numberOfItems: Int { get }

    func setup(dataModel: [CellModel])
    func getTitle(from index: Int) -> String

    func selectModel(index: Int)
}

protocol SelectOptionViewModelOutput: AnyObject {
    func onSelectedModel(_ model: CellModel)
}

final class SelectOptionViewModel: SelectOptionViewModelInput {

    // MARK: - Dependencies

    weak var output: SelectOptionViewModelOutput?

    // MARK: - Properties

    private var dataModel: [CellModel] = []

    var numberOfItems: Int {
        dataModel.count
    }

    // MARK: - Public Methods

    func setup(dataModel: [CellModel]) {
        self.dataModel = dataModel
    }

    func getTitle(from index: Int) -> String {
        if index >= 0 && index < dataModel.count {
            return dataModel[index].title
        }
        return ""
    }

    func selectModel(index: Int) {
        let model = dataModel[index]
        output?.onSelectedModel(model)
    }
}
