//
//  ContactServiceDTO.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 01/10/2020.
//

import Foundation

struct ContactServiceDTO: Codable {
    let dateAdded: Date?
    let name: String?
    let email: String?
    let phoneNumber: String?
    let jobTitle: String?
    let age: Int?
    let avatar: URL?

    func transformToContact() -> Contact {
        return Contact(dateAdded: self.dateAdded,
                       name: self.name,
                       email: self.email,
                       phoneNumber: self.phoneNumber,
                       jobTitle: self.jobTitle,
                       age: self.age,
                       cachedImage: CachedImage(urlImage: self.avatar))
    }
}
