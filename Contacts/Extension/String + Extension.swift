//
//  String + Extension.swift
//  editContacts2
//
//  Created by NIGEL FAUSTINO on 2/25/20.
//  Copyright © 2020 NIGEL FAUSTINO. All rights reserved.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailRegEx = "^([\\w\\-\\.+]+)@([\\w\\-\\.]+)\\.([a-zA-Z]{2,6})$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    var isValidPhone: Bool {
        let phoneRegEx = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }

    var isValidTwitter: Bool {
        let twitterRegEx = "@([a-zA-Z0-9]{1,15})$"
        let twitterTest = NSPredicate(format: "SELF MATCHES %@", twitterRegEx)
        return twitterTest.evaluate(with: self)

    }
}

