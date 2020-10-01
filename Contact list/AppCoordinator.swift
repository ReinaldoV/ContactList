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
        let interactor = ContactListInteractor(contactsService: ContactsService())
        let presenter = ContactListPresenter(interactor: interactor)
        presenter.delegate = self
        let viewController = ContactListViewController.instantiate(presenter: presenter)
        presenter.viewController = viewController
        self.navigationController.viewControllers = [viewController]
    }

    private func showDetailContact(withContact contact: Contact) {
        let presenter = ContactDetailPresenter(contact: contact)
        let viewController = ContactDetailViewController.instantiate(presenter: presenter)
        self.navigationController.show(viewController, sender: self.navigationController)
    }
}

extension AppCoordinator: ContactListDelegate {
    func openDetail(ofContact contact: Contact) {
        self.showDetailContact(withContact: contact)
    }
}
