//
//  ContactListInteractor.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 30/09/2020.
//

protocol ContactListInteractorProtocol {
    func loadContacts(onSuccess: @escaping ([Contact]) -> Void,
                      onError: @escaping (_ error: Error?) -> Void)
}

class ContactListInteractor {

    let contactsService: ContactsService

    init(contactsService: ContactsService) {
        self.contactsService = contactsService
    }
}

extension ContactListInteractor: ContactListInteractorProtocol {

    func loadContacts(onSuccess: @escaping ([Contact]) -> Void, onError: @escaping (Error?) -> Void) {
        contactsService.getContacts(onSuccess: onSuccess, onError: onError)
    }
}
