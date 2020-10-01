//
//  ContactListPresenter.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 30/09/2020.
//

import UIKit

protocol ContactListDelegate: class {
    func openDetail(ofContact contact: Contact)
}

protocol ContactListPresenterProtocol {
    func loadContacts()
    func numberOfRows() -> Int
    func contactInfo(atIndex index: Int) -> ContactViewModel?
    func cellTapped(atIndex index: Int)
}

class ContactListPresenter {

    var contacts = [Contact]()
    let interactor: ContactListInteractorProtocol
    weak var viewController: ContactListViewControllerProtocol?
    weak var delegate: ContactListDelegate?

    init(interactor: ContactListInteractorProtocol) {
        self.interactor = interactor
    }
}

extension ContactListPresenter: ContactListPresenterProtocol {

    func loadContacts() {
        if !contacts.isEmpty {
            DispatchQueue.main.async {
                self.viewController?.reloadTable()
            }
        }
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
                                cachedImage: contacts[index].cachedImage)
    }

    func cellTapped(atIndex index: Int) {
        guard index < contacts.count && index >= 0 else { return }
        delegate?.openDetail(ofContact: self.contacts[index])
    }
}
