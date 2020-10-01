//
//  ContactsService.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 01/10/2020.
//

import Foundation

class ContactsService {

    func getContacts(onSuccess: @escaping ([ContactServiceDTO]) -> Void,
                     onError: @escaping (_ error: Error?) -> Void) {

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "5f6b173201d6570016d0410a.mockapi.io"
        urlComponents.path = "/api/contacts"
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            if let error = responseError {
                onError(error)
            } else if let jsonData = responseData {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(self.dateFormat())
                do {
                    let contactsResponse = try decoder.decode(Array<ContactServiceDTO>.self, from: jsonData)
                    onSuccess(contactsResponse)
                } catch {
                    onError(error)
                }
            }
        }
        task.resume()
    }

    private func dateFormat() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
}
