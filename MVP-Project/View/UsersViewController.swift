//
//  ViewController.swift
//  MVP-Project
//
//  Created by Noor Walid on 11/04/2021.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PresenterDelegate {
    
    let presenter = Presenter()
    var users = [User]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        title = "Users"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        presenter.delegate = self
        
        presenter.getUsers()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else {
            print("default cell created")
            return UITableViewCell()
        }
        
        cell.fullName.text = "\(users[indexPath.row].data[indexPath.row].firstName) \(users[indexPath.row].data[indexPath.row].lastName)"
        cell.emailLabel.text = users[indexPath.row].data[indexPath.row].email
        //cell.userImage.image = users[indexPath.row].data[indexPath.row].image
        
        return cell
    }
    
    func presentUsers(users: [User]) {
        self.users = users
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        print("users here: \(users)")
    }
    
    func presentDetails(user: User) {
        
    }
}

