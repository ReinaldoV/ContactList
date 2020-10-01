//
//  ContactDetailViewController.swift
//  Contact list
//
//  Created by Reinaldo Villanueva Javierre on 01/10/2020.
//

import UIKit

class ContactDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    var presenter: ContactDetailPresenterProtocol?

    static func instantiate(presenter: ContactDetailPresenterProtocol) -> ContactDetailViewController {
        let nib = UINib(nibName: "ContactDetailView", bundle: nil)
        let viewController = nib.instantiate(withOwner: self, options: nil)[0] as? ContactDetailViewController
        viewController?.presenter = presenter
        return viewController ?? ContactDetailViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageView.load(url: presenter?.imageURL())
        nameLabel.text = presenter?.name()
        phoneLabel.text = presenter?.phone()
        emailLabel.text = presenter?.email()
        ageLabel.text = presenter?.age()
        jobLabel.text = presenter?.job()
        dateLabel.text = presenter?.date()
    }
}
