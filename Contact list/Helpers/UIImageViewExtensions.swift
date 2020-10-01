//
//  UIImageViewExtensions.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 01/10/2020.
//

import UIKit

extension UIImageView {
    func load(url: URL?) {
        guard let urlNotOptional = url else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: urlNotOptional) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
