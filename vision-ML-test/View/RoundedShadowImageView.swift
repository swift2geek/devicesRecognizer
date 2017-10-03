//
//  RoundedShadowImageView.swift
//  vision-ML-test
//
//  Created by Vladimir Valter on 27/09/2017.
//  Copyright © 2017 Vladimir Valter. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedShadowImageView: UIImageView {

    override func awakeFromNib() {
        setupView()
    }

    override func prepareForInterfaceBuilder() {
        setupView()
    }

    func setupView() {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 15
        self.layer.shadowOpacity = 0.75
        self.layer.cornerRadius = 15
    }

}
