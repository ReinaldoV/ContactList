//
//  ContactListViewControllerTest.swift
//  Contact listTests
//
//  Created by Reinaldo Villanueva Javierre on 01/10/2020.
//

import XCTest
@testable import Contact_list

class ContactListViewControllerTest: XCTestCase {

    var sut: ContactListViewController!
    var presenterMock: ContactListPresenterMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        releaseSut()
        super.tearDown()
    }

    func createSut() {
        presenterMock = ContactListPresenterMock()
        sut = ContactListViewController.instantiate(presenter: presenterMock)
        sut.presenter = presenterMock
    }

    func releaseSut() {
        presenterMock = nil
        sut = nil
    }

    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }
    
    // MARK: - Test viewDidLoad
    func testLoadViewSuccess() {
        _ = sut.view
        XCTAssertNotNil(sut.presenter, "Presenter must not be nil.")
    }

    func testViewAppearSuccess() {
        _ = sut.view
        sut.viewWillAppear(true)
        XCTAssertNotNil(sut.presenter, "Presenter must not be nil.")
        XCTAssertTrue(presenterMock.loadContactsWasCalled)
    }
}

class ContactListPresenterMock: ContactListPresenterProtocol {

    var loadContactsWasCalled = false
    var numberOfRowsWasCalled = false
    var contactInfoWasCalled = false
    var cellTappedWasCalled = false

    func loadContacts() {
        loadContactsWasCalled = true
    }

    func numberOfRows() -> Int {
        numberOfRowsWasCalled = true
        return 0
    }

    func contactInfo(atIndex index: Int) -> ContactViewModel? {
        contactInfoWasCalled = true
        return nil
    }

    func cellTapped(atIndex index: Int) {
        cellTappedWasCalled = true
    }
}
