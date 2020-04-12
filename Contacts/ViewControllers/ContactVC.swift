//
//  ContactVC.swift
//  editContacts2
//
//  Created by NIGEL FAUSTINO on 2/21/20.
//  Copyright © 2020 NIGEL FAUSTINO. All rights reserved.
//

import UIKit
import Stevia

class ContactVC: UITableViewController {
    private let sections: [ContactSection] = [ContactSection(.name), ContactSection(.description), ContactSection(.email), ContactSection(.phone), ContactSection(.twitter)]

    var isValid: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Contact"
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: "textfield")
        tableView.register(TextViewCell.self, forCellReuseIdentifier: "textview")

        tableView.separatorStyle = .none
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
        saveButton.isEnabled = false
    }

    @objc private func saveButtonTapped() {

    }

    private func enableSave() {
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].contactInfo.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        switch section.sectionType {
        case .email, .phone, .twitter, .name:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textfield") as! TextFieldCell
            cell.delegate = self
            cell.configure(sections[indexPath.section].contactInfo[indexPath.row])
            cell.selectionStyle = .none
            return cell

        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textview") as! TextViewCell
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = SectionHeader()
        header.configure(sections[section])
        header.delegate = self
        return header
    }
}

extension ContactVC: SectionHeaderDelegate, TextFieldCellDelegate {
    func textFieldDidType(_ cell: TextFieldCell, _ text: String, _ isValid: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        sections[indexPath.section].contactInfo[ indexPath.row].info = text
        self.isValid = isValid
            navigationItem.rightBarButtonItem?.isEnabled = isValid
    }

    func deleteDidTap(_ cell: TextFieldCell) {
            guard let indexPath = tableView.indexPath(for: cell) else { return }
        sections[indexPath.section].contactInfo.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        if sections[indexPath.section].contactInfo.count == 1 {
            tableView.reloadData()
        }
   }

    func addButtonDidTap(_ section: ContactSection) {
        section.contactInfo.append(ContactInfo("", section))
        tableView.reloadData()
    }
}
