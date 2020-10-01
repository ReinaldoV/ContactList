//
//  ContactListViewController.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 30/09/2020.
//

import UIKit

protocol ContactListViewControllerProtocol: class {
    func showError(errorDescription: String)
    func reloadTable()
}

class ContactListViewController: UIViewController {

    @IBOutlet weak var table: UITableView!

    private let cellIdentifier = "ContactListCell"
    var presenter: ContactListPresenterProtocol?

    static func instantiate(presenter: ContactListPresenterProtocol) -> ContactListViewController {
        let nib = UINib(nibName: "ContactListView", bundle: nil)
        let viewController = nib.instantiate(withOwner: self, options: nil)[0] as? ContactListViewController
        viewController?.presenter = presenter
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.loadContacts()
    }
}

extension ContactListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = table.dequeueReusableCell(withIdentifier: cellIdentifier) as? ContactListCell {
            cell.configureCell(withInfo: presenter?.contactInfo(atIndex: indexPath.row))
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.cellTapped(atIndex: indexPath.row)
    }
}

extension ContactListViewController: ContactListViewControllerProtocol {

    func showError(errorDescription message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func reloadTable() {
        self.table.reloadData()
    }
}
