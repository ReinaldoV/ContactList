//
//  Contact.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 01/10/2020.
//

import Foundation
import UIKit

struct Contact {
    let dateAdded: Date?
    let name: String?
    let email: String?
    let phoneNumber: String?
    let jobTitle: String?
    let age: Int?
    let cachedImage: CachedImage
}

class CachedImage: Equatable {

    let avatarURL: URL?
    var avatar: UIImage?

    init(urlImage: URL?) {
        self.avatarURL = urlImage
    }


    static func == (lhs: CachedImage, rhs: CachedImage) -> Bool {
        lhs.avatarURL == rhs.avatarURL && lhs.avatar == rhs.avatar
    }
}
