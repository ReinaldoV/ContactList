//
//  ContactDetailPresenterTest.swift
//  Contact listTests
//
//  Created by Reinaldo Villanueva Javierre on 01/10/2020.
//

import XCTest
@testable import Contact_list

class ContactDetailPresenterTest: XCTestCase {

    var sut: ContactDetailPresenter!
    var contactMock: Contact!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        releaseSut()
        super.tearDown()
    }

    func createSut() {
        contactMock = Contact(dateAdded: Date(timeIntervalSince1970: 0),
                              name: "name",
                              email: "email",
                              phoneNumber: "phone",
                              jobTitle: "jonTitle",
                              age: 50,
                              cachedImage: CachedImage(urlImage: nil))
        sut = ContactDetailPresenter(contact: contactMock)
    }

    func releaseSut() {
        contactMock = nil
        sut = nil
    }

    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }

    func testNameNil() {
        makeEverythingNilOnContact()
        
        let result = sut.name()
        let expected = ""
        
        XCTAssertEqual(result, expected)
    }

    func testNameNotNil() {
        
        let result = sut.name()
        let expected = contactMock.name
        
        XCTAssertEqual(result, expected)
    }
    
    func testPhoneNil() {
        makeEverythingNilOnContact()
        
        let result = sut.phone()
        let expected = ""
        
        XCTAssertEqual(result, expected)
    }

    func testPhoneNotNil() {
        
        let result = sut.phone()
        let expected = contactMock.phoneNumber
        
        XCTAssertEqual(result, expected)
    }
    
    func testEmailNil() {
        makeEverythingNilOnContact()
        
        let result = sut.email()
        let expected = ""
        
        XCTAssertEqual(result, expected)
    }

    func testEmailNotNil() {
        
        let result = sut.email()
        let expected = contactMock.email
        
        XCTAssertEqual(result, expected)
    }
    
    func testAgelNil() {
        makeEverythingNilOnContact()
        
        let result = sut.age()
        let expected = ""
        
        XCTAssertEqual(result, expected)
    }

    func testAgeNotNil() {
        
        let result = sut.age()
        let expected = contactMock.age?.description
        
        XCTAssertEqual(result, expected)
    }
    
    func testJobNil() {
        makeEverythingNilOnContact()
        
        let result = sut.job()
        let expected = ""
        
        XCTAssertEqual(result, expected)
    }

    func testJobNotNil() {
        
        let result = sut.job()
        let expected = contactMock.jobTitle
        
        XCTAssertEqual(result, expected)
    }
    
    func testDateNil() {
        makeEverythingNilOnContact()
        
        let result = sut.date()
        let expected = ""
        
        XCTAssertEqual(result, expected)
    }

    func testDateNotNil() {
        
        let result = sut.date()
        let expected = contactMock.dateAdded?.description
        
        XCTAssertEqual(result, expected)
    }
    
    func testImageNil() {
        makeEverythingNilOnContact()
        
        let result = sut.image()
        let expected: CachedImage? = contactMock.cachedImage
        
        XCTAssertEqual(result, expected)
    }

    func testImageNotNil() {
        
        let result = sut.image()
        let expected = contactMock.cachedImage
        
        XCTAssertEqual(result, expected)
    }

    private func makeEverythingNilOnContact() {
        contactMock = Contact(dateAdded: nil,
                              name: nil,
                              email: nil,
                              phoneNumber: nil,
                              jobTitle: nil,
                              age: nil,
                              cachedImage: CachedImage(urlImage: nil))
        sut = ContactDetailPresenter(contact: contactMock)
    }
}
