//
//  OnboardingViewController.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 10/04/23.
//
import UIKit

final class OnboardingViewController: UIViewController {

    // MARK: - Properties

    private lazy var customView: OnboardingLogic = {
        let view = OnboardingView()
        return view
    }()

    // MARK: - Dependencies

    private lazy var viewModel: OnboardingInput = {
        let viewModel = OnboardingViewModel()
        viewModel.output = self
        return viewModel
    }()

    // MARK: - Layout

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setFirstViewer()
    }

    override func loadView() {
        view = customView
    }

}

extension OnboardingViewController: OnboardingOutput {

    

}
