//
//  User.swift
//  MVP-Project
//
//  Created by Noor Walid on 14/04/2021.
//

import Foundation

struct User: Codable {
    let data: [UserInstance]
}

struct UserInstance: Codable {
    let id: Int
    let email, firstName, lastName: String
    
    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
