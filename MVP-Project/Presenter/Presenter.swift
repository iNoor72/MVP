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
    func presentUsers(users: User)
    func presentDetails(user: User, index: Int)
    
}

typealias UserPresetner = PresenterDelegate & UIViewController

class Presenter {
    weak var delegate: UserPresetner?
    func getUsers() {
        //We can use the router here if we want.
        //let url = Router.users
        let url = "https://reqres.in/api/users?page=2"
        AF.request(url).responseDecodable { [weak self] (response:(DataResponse<User, AFError>)) in
            switch response.result {
            case .success (let data):
                print("Success fetching data, \(data)")
                
                //Call the presentUsers function of the delegate to store the data after finishing the Network call
                self?.delegate?.presentUsers(users: data)
            
            case .failure (let error):
                print("Failure fetching data, \(error.localizedDescription)")
            
            }
        }
    }
}
