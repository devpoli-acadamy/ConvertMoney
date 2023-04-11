//
//  DPButton.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 05/04/23.
//

import UIKit

final class DPButton: UIButton {

    init(){
        super.init(frame: .zero)

        var config = UIButton.Configuration.plain()
        config.background.backgroundColor = .orange
        config.background.cornerRadius = 16
        configuration = config
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

}
