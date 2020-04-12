//
//  ContactInfo.swift
//  editContacts2
//
//  Created by NIGEL FAUSTINO on 2/25/20.
//  Copyright © 2020 NIGEL FAUSTINO. All rights reserved.
//

import Foundation

class ContactInfo {
    weak var section: ContactSection?
    var info: String

    init(_ info: String, _ section: ContactSection) {
        self.info = info
        self.section = section
    }
}
