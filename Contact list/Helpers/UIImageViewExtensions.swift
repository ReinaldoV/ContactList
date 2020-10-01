//
//  UIImageViewExtensions.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 01/10/2020.
//

import UIKit

extension UIImageView {
    func load(cachedImage: CachedImage?) {
        guard cachedImage?.avatar == nil else {
            DispatchQueue.main.async {
                self.image = cachedImage?.avatar
            }
            return
        }
        guard let urlNotOptional = cachedImage?.avatarURL else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: urlNotOptional) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cachedImage?.avatar = image
                        self?.image = image
                    }
                }
            }
        }
    }
}
