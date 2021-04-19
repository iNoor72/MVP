//
//  ViewController.swift
//  MVP-Project
//
//  Created by Noor Walid on 11/04/2021.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PresenterDelegate {
    
    let presenter = Presenter()
    var users = User(data: [UserInstance]())
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        presenter.delegate = self
        
        presenter.getUsers()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else {
            print("default cell created")
            return UITableViewCell()
        }
        
        cell.fullName.text = "\(users.data[indexPath.row].firstName) \(users.data[indexPath.row].lastName)"
        cell.emailLabel.text = users.data[indexPath.row].email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.delegate?.presentDetails(user: users, index: indexPath.row)
    }
    
    //MARK:- Delegate Protocol Functions
    
    func presentUsers(users: User) {
        self.users = users
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        print("users here: \(users)")
    }
    
    func presentDetails(user: User, index: Int) {
            let destination = storyboard?.instantiateViewController(identifier: "DetailsVC") as! MoreDetailsViewController
            destination.user = user
            destination.index = index
            navigationController?.pushViewController(destination, animated: true)
    }
}

