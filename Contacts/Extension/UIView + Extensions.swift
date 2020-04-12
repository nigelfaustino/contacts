//
//  UIView.swift
//  editContacts2

//
//  Created by NIGEL FAUSTINO on 2/24/20.
//  Copyright © 2020 NIGEL FAUSTINO. All rights reserved.
//

import UIKit

extension UIView {
    func clearAllConstraints() {
        for subview in subviews {
            subview.clearAllConstraints()
        }
        removeConstraints(constraints)
    }
}

