//
//  TextFieldCell.swift
//  editContacts2
//
//  Created by NIGEL FAUSTINO on 2/21/20.
//  Copyright © 2020 NIGEL FAUSTINO. All rights reserved.
//

import UIKit
import Stevia

protocol TextFieldCellDelegate: class {
    func deleteDidTap(_ cell: TextFieldCell)
    func textFieldDidType(_ cell: TextFieldCell, _ text: String, _ isValid: Bool)
}

class TextFieldCell: UITableViewCell {
    weak var delegate: TextFieldCellDelegate?
    var type: SectionType = .name
    private let textField: WarningTextField = {
        let textField = WarningTextField(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        return textField
    }()

    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Delete"), for: .normal)
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func configure(_ contactInfo: ContactInfo) {
        type = contactInfo.section?.sectionType ?? .name
        textField.placeholder(contactInfo.section?.name ?? "")
        textField.text = contactInfo.info
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .allEditingEvents)
        if contactInfo.section?.contactInfo.count == 1 {
            clearAllConstraints()
            textField.fillVertically()
            textField.left(10).top(10).right(10).bottom(10)
        } else {
            showDeleteButton()
        }
    }

// MARK: Private

    private func commonInit() {
        sv(textField)
    }

    private func showDeleteButton() {
        clearAllConstraints()
        sv(deleteButton)
        textField.left(10).top(10).bottom(10).centerVertically()
        deleteButton.right(10).centerVertically()
        deleteButton.Height == textField.Height
        deleteButton.Width == deleteButton.Height
        deleteButton.Left == textField.Right + 10
        deleteButton.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
        presentErrors()
    }

    @objc private func deleteTapped() {
        delegate?.deleteDidTap(self)
    }

    private func isTextFieldInputValid() -> Bool {
        guard let text = textField.text else { return false }
        guard text.count > 0 else { return true }
        switch type {
        case .email:
            return textField.text?.isValidEmail ?? true
        case .name:
            return true
        case .description:
            return true
        case .twitter:
            return textField.text?.isValidTwitter ?? true
        case .phone:
            return textField.text?.isValidPhone ?? true
        }
    }

    private func presentErrors() {
        if !isTextFieldInputValid() {
            textField.backgroundColor = UIColor(red: 0.98, green: 0.88, blue: 0.87, alpha: 1.0)
        } else {
            textField.backgroundColor = .systemGray6
        }
    }


    @objc private func textFieldDidChange() {
        guard let text = textField.text else { return }
        let isValid = isTextFieldInputValid()
        delegate?.textFieldDidType(self, text, isValid)
        presentErrors()
    }

    override func prepareForReuse() {
        reset()
    }

    private func removeDeleteButton() {
        guard deleteButton.isDescendant(of: self) else { return }
        deleteButton.removeFromSuperview()
    }

    private func reset() {
        removeDeleteButton()
        clearAllConstraints()
        textField.text = ""
        textField.backgroundColor = .systemGray6
    }
}
