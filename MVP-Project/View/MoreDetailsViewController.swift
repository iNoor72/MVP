//
//  MoreDetailsViewController.swift
//  MVP-Project
//
//  Created by Noor Walid on 14/04/2021.
//

import UIKit

class MoreDetailsViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var user = User(data: [UserInstance]())
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fullName = user.data[index].firstName + " " + user.data[index].lastName
        nameLabel.text = fullName
        emailLabel.text = user.data[index].email
  }
    
    
    
    
}
