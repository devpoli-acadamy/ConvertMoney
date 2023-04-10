//
//  SplashViewModel.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 05/04/23.
//

import UIKit

// Logic
protocol SplashInput {
    func checkData()
}

// Delegate
protocol SplashOutput: AnyObject {
    func showHome()
    func showOnboarding()
}

final class SplashViewModel: SplashInput {

    weak var output: SplashOutput?

    func checkData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [output] in
            if Bool.random() {
                output?.showHome()
            }else{
                output?.showOnboarding()
            }
        }
    }
}
