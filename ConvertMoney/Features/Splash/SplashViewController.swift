//
//  SplashViewController.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 05/04/23.
//

import UIKit

final class SplashViewController: UIViewController {

    // MARK: - Properties

    private lazy var customView: SplashLogic = {
        let view = SplashView()
        return view
    }()

    // MARK: - Dependencies

    private lazy var viewModel: SplashInput = {
        let viewModel = SplashViewModel()
        viewModel.output = self
        return viewModel
    }()

    // MARK: - Layout

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.checkData()
    }

    override func loadView() {
        view = customView
    }

}

extension SplashViewController: SplashOutput {

    func showHome() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .yellow
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: true)
    }

    func showOnboarding() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .green
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: true)
    }

}
