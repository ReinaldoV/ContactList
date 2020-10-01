//
//  ContactDetailViewControllerTest.swift
//  Contact listTests
//
//  Created by Reinaldo Villanueva Javierre on 01/10/2020.
//

import XCTest
@testable import Contact_list

class ContactDetailViewControllerTest: XCTestCase {

    var sut: ContactDetailViewController!
    var presenter: ContactDetailPresenterMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        releaseSut()
        super.tearDown()
    }

    func createSut() {
        presenter = ContactDetailPresenterMock()
        sut = ContactDetailViewController.instantiate(presenter: presenter)
    }

    func releaseSut() {
        sut = nil
    }

    // MARK: - Basic test.
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
        XCTAssertTrue(presenter.allWasCalled())
    }
}

class ContactDetailPresenterMock: ContactDetailPresenterProtocol {
    var nameWasCalled = false
    var phoneWasCalled = false
    var emailWasCalled = false
    var ageWasCalled = false
    var jobWasCalled = false
    var dateWasCalled = false
    var imageWasCalled = false

    func allWasCalled() -> Bool {
        nameWasCalled && phoneWasCalled && emailWasCalled && ageWasCalled && jobWasCalled && dateWasCalled && imageWasCalled
    }

    func name() -> String {
        nameWasCalled = true
        return ""
    }

    func phone() -> String {
        phoneWasCalled = true
        return ""
    }

    func email() -> String {
        emailWasCalled = true
        return ""
    }

    func age() -> String {
        ageWasCalled = true
        return ""
    }

    func job() -> String {
        jobWasCalled = true
        return ""
    }

    func date() -> String {
        dateWasCalled = true
        return ""
    }

    func image() -> CachedImage? {
        imageWasCalled = true
        return nil
    }
}
