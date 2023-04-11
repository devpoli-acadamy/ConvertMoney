//
//  SplashViewModel.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 05/04/23.
//

import Foundation
import UIKit

// Logic
protocol SplashInput {
    func validData()
}

// Delegate
protocol SplashOutput: AnyObject {
    func showStart()
    func showOnboarding()
}

final class SplashViewModel: SplashInput {

    weak var output: SplashOutput?

    private var onboardingFlowFlag: Bool {
        return (ProcessInfo().environment["ONBOARDING_FLOW"] as? NSString)?.boolValue ?? false
    }

    func validData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [onboardingFlowFlag, output] in
            if !onboardingFlowFlag && UserDefaults.standard.bool(forKey: "first_viewer") {
                output?.showStart()
            } else {
                output?.showOnboarding()
            }

        }
    }
}
