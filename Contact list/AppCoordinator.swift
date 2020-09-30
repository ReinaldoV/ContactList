//
//  AppCoordinator.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 30/09/2020.
//

import UIKit

class AppCoordinator {

    let window: UIWindow

    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()

    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
    }

    func start() {
        self.showContactsViewController()
    }

    private func showContactsViewController() {

    }

}
