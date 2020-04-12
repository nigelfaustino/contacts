//
//  SectionHeader.swift
//  editContacts2
//
//  Created by NIGEL FAUSTINO on 2/21/20.
//  Copyright © 2020 NIGEL FAUSTINO. All rights reserved.
//

import UIKit
import Stevia

protocol SectionHeaderDelegate: class {
    func addButtonDidTap(_ section: ContactSection)
}

class SectionHeader: UIView {
    weak var delegate: SectionHeaderDelegate?
    private var contactSection = ContactSection(.name)

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()

    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func configure(_ section: ContactSection) {
        self.contactSection = section
        titleLabel.text = section.name
        switch section.sectionType {
        case .email, .twitter, .phone:
            addButton.setTitle("+ Add " + section.name, for: .normal)
            addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)

        case .name, .description:
            break
        }
    }

//MARK: Private

    private func commonInit() {
        backgroundColor = .white
        sv(titleLabel,
        addButton
        )
        titleLabel.left(10).bottom(10).top(20)
        addButton.right(10).top(20)
    }

    @objc private func addButtonPressed() {
        delegate?.addButtonDidTap(contactSection)
    }
}
