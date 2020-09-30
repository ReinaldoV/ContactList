//
//  ContactListCell.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 30/09/2020.
//

import UIKit

class ContactListCell: UITableViewCell {

    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!

    func configureCell(withInfo model: ContactViewModel) {
        contactImageView.image = model.image
        nameLabel.text = model.name
        phoneLabel.text = model.phone
    }

    override func layoutSubviews() {
        roundImageView()
    }

    private func roundImageView() {
        contactImageView.layer.cornerRadius = contactImageView.frame.height / 2
    }
}
