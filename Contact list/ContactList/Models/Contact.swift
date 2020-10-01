//
//  Contact.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 01/10/2020.
//

import Foundation

struct Contact: Codable {
    let dateAdded: Date?
    let name: String?
    let email: String?
    let phoneNumber: String?
    let jobTitle: String?
    let age: Int?
    let avatarURL: String?
}
