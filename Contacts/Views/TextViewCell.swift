//
//  TextViewCell.swift
//  editContacts2
//
//  Created by NIGEL FAUSTINO on 2/25/20.
//  Copyright © 2020 NIGEL FAUSTINO. All rights reserved.
//

import UIKit
import Stevia

class TextViewCell: UITableViewCell {
    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .systemGray6

        return textView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        textView.top(10).bottom(10).left(10).right(10)
    }


}
