//
//  ContactListPresenter.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 30/09/2020.
//

import UIKit

protocol ContactListPresenterProtocol {
    func viewDidLoad()
    func numberOfRows() -> Int
    func contactInfo(atIndex index: Int) -> ContactViewModel?
}

class ContactListPresenter {

    var contacts = [Contact]()
    let interactor: ContactListInteractorProtocol
    weak var viewController: ContactListViewControllerProtocol?

    init(interactor: ContactListInteractorProtocol) {
        self.interactor = interactor
    }
}

extension ContactListPresenter: ContactListPresenterProtocol {

    func viewDidLoad() {
        self.interactor.loadContacts { contactsResponse in
            DispatchQueue.main.async {
                self.contacts = contactsResponse
                self.viewController?.reloadTable()
            }
        } onError: { error in
            DispatchQueue.main.async {
                self.viewController?.showError(errorDescription: error?.localizedDescription ?? "An error has ocurred")
            }
        }

    }

    func numberOfRows() -> Int {
        return contacts.count
    }

    func contactInfo(atIndex index: Int) -> ContactViewModel? {
        guard index < contacts.count && index >= 0 else { return nil }
        return ContactViewModel(name: contacts[index].name,
                                phone: contacts[index].phoneNumber,
                                imageUrl: contacts[index].avatarURL)
    }
}
