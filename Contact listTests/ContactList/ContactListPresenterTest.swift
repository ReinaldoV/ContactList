//
//  ContactListPresenterTest.swift
//  Contact listTests
//
//  Created by Reinaldo Villanueva Javierre on 01/10/2020.
//

import XCTest
@testable import Contact_list

class ContactListPresenterTest: XCTestCase {

    var sut: ContactListPresenter!
    var interactorMock: ContactListInteractorMock!
    var viewMock: ContactListViewControllerMock!
    var delegateMock: ContactListDelegateMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        releaseSut()
        super.tearDown()
    }

    func createSut() {
        interactorMock = ContactListInteractorMock()
        viewMock = ContactListViewControllerMock()
        delegateMock = ContactListDelegateMock()
        sut = ContactListPresenter(interactor: interactorMock)
        sut.viewController = viewMock
        sut.delegate = delegateMock
    }

    func releaseSut() {
        interactorMock = nil
        viewMock = nil
        delegateMock = nil
        sut = nil
    }

    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }

    func testLoadContacts() {
        sut.loadContacts()

        XCTAssertTrue(interactorMock.loadContactsWasCalled)
    }

    func testNumerOfRows() {
        sut.contacts = [Contact(dateAdded: nil, name: nil, email: nil, phoneNumber: nil, jobTitle: nil, age: nil, cachedImage: CachedImage(urlImage: nil))]

        let result = sut.numberOfRows()
        let expected = 1

        XCTAssertEqual(result, expected)
    }

    func testNumerOfRowsZero() {

        let result = sut.numberOfRows()
        let expected = 0

        XCTAssertEqual(result, expected)
    }

    func testContactInfoIndexUnderZero() {
        let result = sut.contactInfo(atIndex: -100)

        XCTAssertNil(result)
    }

    func testContactInfoIndexZero() {
        let result = sut.contactInfo(atIndex: 0)

        XCTAssertNil(result)
    }

    func testContactInfoIndexAboveZero() {
        let result = sut.contactInfo(atIndex: 100)

        XCTAssertNil(result)
    }

    func testContactInfoValidIndex() {
        sut.contacts = [Contact(dateAdded: nil, name: nil, email: nil, phoneNumber: nil, jobTitle: nil, age: nil, cachedImage: CachedImage(urlImage: nil))]

        let result = sut.contactInfo(atIndex: 0)

        XCTAssertNotNil(result)
    }

    func testCellTappedIndexUnderZero() {
        sut.cellTapped(atIndex: -100)

        XCTAssertFalse(delegateMock.openDetailWasCalled)
    }

    func testCellTappedIndexZero() {
        sut.cellTapped(atIndex: 0)

        XCTAssertFalse(delegateMock.openDetailWasCalled)
    }

    func testCellTappedIndexAboveZero() {
        sut.cellTapped(atIndex: 100)

        XCTAssertFalse(delegateMock.openDetailWasCalled)
    }

    func testCellTappedValidIndex() {
        sut.contacts = [Contact(dateAdded: nil, name: nil, email: nil, phoneNumber: nil, jobTitle: nil, age: nil, cachedImage: CachedImage(urlImage: nil))]

        sut.cellTapped(atIndex: 0)

        XCTAssertTrue(delegateMock.openDetailWasCalled)
    }
}

class ContactListInteractorMock: ContactListInteractorProtocol {

    var loadContactsWasCalled = false

    func loadContacts(onSuccess: @escaping ([Contact]) -> Void, onError: @escaping (Error?) -> Void) {
        loadContactsWasCalled = true
    }
}

class ContactListViewControllerMock: ContactListViewControllerProtocol {

    var showErrorWasCalled = false
    var reloadTableWasCalled = false

    func showError(errorDescription: String) {
        showErrorWasCalled = true
    }

    func reloadTable() {
        reloadTableWasCalled = true
    }
}

class ContactListDelegateMock: ContactListDelegate {

    var openDetailWasCalled = false

    func openDetail(ofContact contact: Contact) {
        openDetailWasCalled = true
    }
}


