//
//  OnboardingViewModel.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 10/04/23.
//

import UIKit

// Logic
protocol OnboardingInput {
    func setFirstViewer()
}

// Delegate
protocol OnboardingOutput: AnyObject {

}

final class OnboardingViewModel: OnboardingInput {

    weak var output: OnboardingOutput?

    func setFirstViewer() {
        UserDefaults.standard.set(true, forKey: "first_viewer")
    }

}
