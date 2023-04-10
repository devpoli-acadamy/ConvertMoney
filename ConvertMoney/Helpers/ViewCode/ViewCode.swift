//
//  ViewCode.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 05/04/23.
//

import UIKit

// Class Abstrata
class ViewCode: UIView {

    init(){
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
        setupExtras()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func setupViews() {
        fatalError()
    }

    func setupConstraints(){
        fatalError()
    }

    func setupExtras(){

    }

}
