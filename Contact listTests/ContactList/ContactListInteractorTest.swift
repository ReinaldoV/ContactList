//
//  ContactListInteractorTest.swift
//  Contact listTests
//
//  Created by Reinaldo Villanueva Javierre on 01/10/2020.
//

import XCTest
@testable import Contact_list

class ContactListInteractorTest: XCTestCase {

    var sut: ContactListInteractor!
    var serviceMock: ContactsServiceMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        releaseSut()
        super.tearDown()
    }

    func createSut() {
        serviceMock = ContactsServiceMock()
        sut = ContactListInteractor(contactsService: serviceMock)
    }

    func releaseSut() {
        serviceMock = nil
        sut = nil
    }

    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }
    
    func testLoadContacts() {
        sut.loadContacts { _ in
            //not needed
        } onError: { _ in
            //not needed
        }

        XCTAssertTrue(serviceMock.getContactsWasCalled)
    }
}

class ContactsServiceMock: ContactsService {
    
    var getContactsWasCalled = false
    
    override func getContacts(onSuccess: @escaping ([Contact]) -> Void, onError: @escaping (Error?) -> Void) {
        getContactsWasCalled = true
    }
}
