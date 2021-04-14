//
//  Presenter.swift
//  MVP-Project
//
//  Created by Noor Walid on 14/04/2021.
//

import Foundation
import UIKit
import Alamofire

protocol PresenterDelegate: AnyObject {
    func presentUsers(users: [User])
    func presentDetails(user: User)
    
}

typealias UserPresetner = PresenterDelegate & UIViewController

class Presenter {
    
    weak var delegate: UserPresetner?
    
    
    func getUsers() {
//        let url = Router.users
        let url = "https://reqres.in/api/users?page=2"
        AF.request(url).responseDecodable { [weak self] (response:(DataResponse<User, AFError>)) in
            switch response.result {
            case .success (let data):
                print("Success fetching data, \(data)")
            
            case .failure (let error):
                print("Failure fetching data, \(error.localizedDescription)")
            
            }
        }
    }
    
}
