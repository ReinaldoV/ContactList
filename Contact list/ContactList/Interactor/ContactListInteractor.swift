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
        contactsService.getContacts(onSuccess: {contacts in
            let sortedContacts = contacts.sorted(by: { (lhs, rhs) -> Bool in
                
                if let lhsName = lhs.name, let rhsName = rhs.name {
                    return lhsName < rhsName
                }

                if lhs.name == nil && rhs.name == nil {
                    return false
                }

                if lhs.name == nil {
                    return false
                }

                if rhs.name == nil {
                    return true
                }
                return true
            })
            onSuccess(sortedContacts)
        }, onError: onError)
    }
}
