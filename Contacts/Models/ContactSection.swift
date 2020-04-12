//
//  ContactSection.swift
//  editContacts2
//
//  Created by NIGEL FAUSTINO on 2/21/20.
//  Copyright © 2020 NIGEL FAUSTINO. All rights reserved.
//

import Foundation

enum SectionType: Int {
    case name = 0
    case description = 1
    case email = 2
    case twitter = 3
    case phone = 4
}

class ContactSection {
    var name: String
    var sectionType: SectionType
    var contactInfo: [ContactInfo] = []

    init(_ type: SectionType) {
        self.sectionType = type
        switch type {
        case .email:
            self.name = "Email"
        case .twitter:
            self.name = "Twitter"
        case .phone:
            self.name = "Phone"
        case .name:
            self.name = "Name"
        case .description:
            self.name = "Description"
        }
        contactInfo.append(ContactInfo("", self))

    }
}
