//
//  WarningTextField.swift
//  editContacts2
//
//  Created by NIGEL FAUSTINO on 2/24/20.
//  Copyright © 2020 NIGEL FAUSTINO. All rights reserved.
//

import UIKit
import Stevia

class WarningTextField: UITextField {
    private var padding = UIEdgeInsets.zero

    private let warningIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "WarningIcon"))
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return imageView
    }()

    init(_ padding: UIEdgeInsets) {
        self.padding = padding
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    private func commonInit() {
        backgroundColor = .systemGray6
        sv(warningIcon)
        warningIcon.right(5).top(5)
        rightView = warningIcon
    }
}
