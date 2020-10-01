//
//  ContactDetailPresenter.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 01/10/2020.
//

import Foundation

protocol ContactDetailPresenterProtocol {
    func name() -> String
    func phone() -> String
    func email() -> String
    func age() -> String
    func job() -> String
    func date() -> String
    func imageURL() -> URL?
}

class ContactDetailPresenter {
    let contact: Contact

    init(contact: Contact) {
        self.contact = contact
    }
}

extension ContactDetailPresenter: ContactDetailPresenterProtocol {

    func name() -> String {
        return contact.name ?? ""
    }

    func phone() -> String {
        return contact.phoneNumber ?? ""
    }

    func email() -> String {
        return contact.email ?? ""
    }

    func age() -> String {
        return contact.age?.description ?? ""
    }

    func job() -> String {
        return contact.jobTitle ?? ""
    }

    func date() -> String {
        return contact.dateAdded?.description ?? ""
    }

    func imageURL() -> URL? {
        return contact.avatarURL
    }
}
