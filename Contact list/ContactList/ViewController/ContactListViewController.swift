//
//  ContactListViewController.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 30/09/2020.
//

import UIKit

class ContactListViewController: UIViewController {

    private let cellIdentifier = "ContactListCell"
    @IBOutlet weak var table: UITableView!

    static func instantiate() -> ContactListViewController {
        let nib = UINib(nibName: "ContactListView", bundle: nil)
        let viewController = nib.instantiate(withOwner: self, options: nil)[0] as? ContactListViewController
        return viewController ?? ContactListViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        self.title = "Contact list"
        let contactListCellNib = UINib(nibName: "ContactListCellView", bundle: nil)
        table.register(contactListCellNib, forCellReuseIdentifier: cellIdentifier)
    }
}

extension ContactListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15 //presenter
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = table.dequeueReusableCell(withIdentifier: cellIdentifier) as? ContactListCell {
            let mockContact = ContactViewModel(name: "PlaceHolderName", phone: "666777888", image: nil)
            cell.configureCell(withInfo: mockContact)
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Add functionality
    }
}
